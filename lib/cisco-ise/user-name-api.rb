require 'cisco-ise/session-parameters'

module CiscoISE
  #
  # Make a User Name API call and return a Session Parameter object
  #
  # #Parameters
  # session<CiscoISE::HttpSession>::  The ISE http session that the API call should be made against
  # user_name<String>:: The user name that we are asking the ISE to search for.
  #
  # @examples
  #   #create session
  #   ise_session   = CiscoISE::HttpSession.new("device-name","myusername","mypassword")
  #
  #   #issue version API call and retrieve the product
  #   user_name_search = CiscoISE::UserNameApi.new(ise_session, 'username')
  #
  #   #work with the parsed XML data
  #   user_name_search.each do |record|
  #     puts record.user_name + "|" + record.nas_ip_address
  #   end
  #
  #   #view the raw XML
  #   puts user_name_search.xml.to_s
  #
  class UserNameApi < CommonSession

      def initialize(session, user_name)
        super(session, "Session/UserName/#{user_name}")
      end

  end
end