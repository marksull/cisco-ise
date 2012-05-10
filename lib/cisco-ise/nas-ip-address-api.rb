require 'cisco-ise/session-parameters'

module CiscoISE

  #
  # Make a NAS IP Address API call
  #
  # #Parameters
  # session<CiscoISE::HttpSession>::  The ISE http session that the API call should be made against
  #
  # @examples
  #   #Create session
  #   ise_session   = CiscoISE::HttpSession.new("device-name","myusername","mypassword")
  #
  #   #Obtain a list of sessions for a specific NAS
  #   session = CiscoISE::NasIpAddressApi.new(ise_session,'1.1.1.1')
  #
  #   #Iterate through each session
  #   session.each do |record|
  #     puts record.user_name + ":" + record.nas_ip_address
  #   end
  #
  #   #Output the raw XML
  #   puts session.xml.to_s
  #
  class NasIpAddressApi < CommonSession

      def initialize(session, ip_address)
        super(session, "Session/IPAddress/#{ip_address}")
      end

  end
end