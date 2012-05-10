require 'cisco-ise/auth-status-element'

module CiscoISE

  #
  # Make an Auth Status API call
  #
  # #Parameters
  # session<CiscoISE::HttpSession>::  The ISE http session that the API call should be made against
  # seconds<Fixnum>:: Limits results to those that occurred in the past <seconds>
  # records<Fixnum>:: Limits the amount of records returned
  #
  # @examples
  #   #Create session
  #   ise_session   = CiscoISE::HttpSession.new("device-name","myusername","mypassword")
  #
  #   #Create and Auth Status session. By default this query returns records that occurred in the last 10 days
  #   #(864000 seconds) and limits the records to 200.
  #   auth = CiscoISE::AuthStatusApi.new(ise_session, '00:17:89:01:23:45')
  #
  #   #To limit the results to events in the last hour (60 seconds x 60 minutes = 3600 seconds) and limit the records to 100:
  #   auth = CiscoISE::AuthStatusApi.new(ise_session, '00:17:89:01:23:45',3600,100)

  #   #Iterate through each auth status
  #   auth.each do |element|
  #     puts "doing something with " + element.username
  #   end
  #
  class AuthStatusApi < CommonList

      def initialize(session, mac_address, seconds = 0, records = 0 )
        super(session, "AuthStatus/MACAddress/#{mac_address}/#{seconds}/#{records}/All")
      end

      def each
        super('/authStatusOutputList/authStatusList/authStatusElements',CiscoISE::AuthStatusElement)
      end

  end
end