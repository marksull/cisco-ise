require 'cisco-ise/failure-reason'

module CiscoISE

  #
  # Make a Failure Reason API call
  #
  # #Parameters
  # session<CiscoISE::HttpSession>::  The ISE http session that the API call should be made against
  #
  # @examples
  #   #Create session
  #   ise_session   = CiscoISE::HttpSession.new("device-name","myusername","mypassword")
  #
  #   #Failure Reason List example
  #   failure       = CiscoISE::FailureReasonsApi.new(ise_session)
  #
  #   #Retrieve a specific code
  #   code = failure.find_code('86023')
  #   puts code.failure_id + '|' + code.cause
  #
  #   #Iterate through each failure code
  #   failure.each do |code|
  #     puts code.id + code.cause
  #   end
  #
  #   #Output the raw XML
  #   puts failure.xml.to_s
  #

  class FailureReasonsApi < CommonList

      def initialize(session)
        super(session, 'FailureReasons')
      end

      def each
        super("*/failureReason",CiscoISE::FailureReason)
      end

      def find_code(code)
        find("*/failureReason[@id='#{code}']", CiscoISE::FailureReason)
      end

  end
end