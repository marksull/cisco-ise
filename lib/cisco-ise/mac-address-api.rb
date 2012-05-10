require 'cisco-ise/session-parameters'

module CiscoISE

  #
  # Make a MAC Address API call
  #
  # #Parameters
  # session<CiscoISE::HttpSession>::  The ISE http session that the API call should be made against
  #
  # @examples
  #   #Create session
  #   ise_session   = CiscoISE::HttpSession.new("device-name","myusername","mypassword")
  #
  #   #Obtain a list of sessions for a specific MAC Address
  #   mac = CiscoISE::MacAddressApi.new(ise_session,'00:17:89:01:23:45')
  #
  #   #Iterate through each MAC Address record
  #   mac.each do |record|
  #     puts record.user_name + ":" + record.nas_ip_address
  #   end
  #
  #   #Output the raw XML
  #   puts mac.xml.to_s
  #
  class MacAddressApi < CommonSession

      def initialize(session, mac_address)
        super(session, "Session/MACAddress/#{mac_address}")
      end

  end
end