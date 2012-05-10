require 'openssl'
require 'net/https'
require "rexml/document"

module CiscoISE

  #
  # Create an ISE HTTP Session Handler
  #
  # #Parameters
  # host<String>::  The IP address or DNS name of the ISE MnT to be queried
  # username<String>::  The username used for authenticating to the ISE
  # password<String>::  The password used for authenticating to the ISE
  # use_ssl<TrueClass|FalseClass>:: A flag indicating whether SSL should be used. Default is TRUE, which is SSL enabled
  # verify_cert<TrueClass|FalseClass>:: A flag indicating whether certificate validation should be performed. Default is FALSE, which is certificate will not be validated
  # debug<TrueClass|FalseClass>:: A flag indicating whether debug data should be output
  #
  # @examples
  #   #Create session
  #   ise_session   = CiscoISE::HttpSession.new("device-name","myusername","mypassword")
  #
  #
  class HttpSession

    SSL_ENABLED   = true
    SSL_DISABLED  = false
    CERT_VERIFY_ENABLED   = true
    CERT_VERIFY_DISABLED  = false

    def initialize(host, username, password, use_ssl = SSL_ENABLED, verify_cert = CERT_VERIFY_DISABLED, debug = FALSE)

      # hostname or IP of ISE to connect too
      @host         = host

      # username to use to authenticate to ISE
      @username     = username

      # password to use to authenticate to ISE
      @password     = password

      # use SSL
      @use_ssl      = use_ssl

      # should certificate be verified when using SSL
      @verify_cert  = verify_cert

      # lets initialize the http sessions
      setup_http_session

      # last response from api call
      @last_response = ''

      # debugging enabled?
      @debug         = debug

    end

    #
    # The primary interface of this class which issues a single API command and returns a parsed XML document of the response
    #
    def call_api(command, delete = false)
      REXML::Document.new(execute_one_call(command, delete))
    end



    private

    # root of all API calls
    API_ROOT = '/ise/mnt/api/'

    # Setup the http session ready for use
    def setup_http_session
      @http              = Net::HTTP.new(@host, (@use_ssl ? 443 : 80))
      @http.use_ssl      = @use_ssl
      @http.verify_mode  = OpenSSL::SSL::VERIFY_NONE unless @verify_cert
    end

    # Execute a single HTTP request and return its response
    def execute_one_call(command, delete)
          @http.start do |http|
              puts "DEBUG: API Call : #{API_ROOT + command}" if @debug

              # The ISE API can use either GET or DELETE for calls. Ensure the correct method is used.
              req = delete ? Net::HTTP::Delete.new(API_ROOT + command) : Net::HTTP::Get.new(API_ROOT + command)

              # Authentication enable
              req.basic_auth(@username, @password)
              resp  = http.request(req).body
              puts "DEBUG: Response : #{resp}" if @debug
              return resp
          end
          ''
    end

  end

end

