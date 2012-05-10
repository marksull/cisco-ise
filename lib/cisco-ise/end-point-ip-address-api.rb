require 'cisco-ise/session-parameters'

module CiscoISE

  #
  # Make a End Point IP Address API call
  #
  # #Parameters
  # session<CiscoISE::HttpSession>::  The ISE http session that the API call should be made against
  #
  # @examples
  #   #Create session
  #   ise_session   = CiscoISE::HttpSession.new("device-name","myusername","mypassword")
  #
  #   #Obtain a list of sessions for a specific end point IP Address
  #   session = CiscoISE::EndPointIpAddressApi.new(ise_session,'10.10.10.10')
  #
  #   #Iterate through each session record
  #   session.each do |record|
  #     puts record.user_name + ":" + record.nas_ip_address
  #   end
  #
  #   #Output the raw XML
  #   puts session.xml.to_s
  #
  class EndPointIpAddressApi < CommonSession

      def initialize(session, ip_address)
        super(session, "Session/EndPointIPAddress/#{ip_address}")
      end

  end
end