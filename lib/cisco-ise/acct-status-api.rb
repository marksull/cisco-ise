require 'cisco-ise/acct-status-element'

module CiscoISE

  #
  # Make an Acct Status API call
  #
  # #Parameters
  # session<CiscoISE::HttpSession>::  The ISE http session that the API call should be made against
  # mac_address<String>:: The MAC address that is being search for
  # duration(Fixnum)  How many seconds to look back for the account status
  #
  # @examples
  #   #Create session
  #   ise_session   = CiscoISE::HttpSession.new("device-name","myusername","mypassword")
  #
  #   #Create and Acct Status session
  #   acct = CiscoISE::AcctStatusApi.new(ise_session, '00:17:89:01:23:45', 20000)
  #
  #   acct.each do |element|
  #     puts element.calling_station_id + ':' + element.paks_in
  #   end
  #
  class AcctStatusApi < CommonList

      def initialize(session, mac_address, duration = 0)
        super(session, "AcctStatus/MACAddress/#{mac_address}/#{duration}")
      end

      def each
        super('/acctStatusOutputList/acctStatusList/acctStatusElements',CiscoISE::AcctStatusElement)
      end

  end
end