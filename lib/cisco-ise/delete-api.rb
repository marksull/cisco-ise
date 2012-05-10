module CiscoISE

  #
  # Make a Delete API call
  #
  # #Parameters
  # session<CiscoISE::HttpSession>::  The ISE http session that the API call should be made against
  #
  # @examples
  #   #Create session
  #   ise_session   = CiscoISE::HttpSession.new("device-name","myusername","mypassword")
  #
  #   #Create a Delete API session
  #   delete = CiscoISE::DeleteApi.new(ise_session)
  #
  #   #delete a specific MAC address
  #   delete.mac_address('00:17:89:01:23:45')
  #
  #   #verify last delete
  #   puts delete.success?.to_s
  #
  #   #delete all sessions
  #   delete.all
  #
  class DeleteApi

    attr_reader :xml

    def initialize(session)
      @session = session
      self
    end

    def mac_address(mac_address)
      @xml = @session.call_api("Session/Delete/MACAddress/#{mac_address}", true)
      self
    end

    def session_id(session_id)
      @xml = @session.call_api("Session/Delete/SessionID/#{session_id}", true)
      self
    end

    def all
      @xml = @session.call_api("Session/Delete/All", true)
      self
    end

    def success?
      success = @xml.elements["/mnt-request-result/status"]
      success.nil? ? false : success.text == 'SUCCESSFUL'
    end

  end
end