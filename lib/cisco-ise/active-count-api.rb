require 'cisco-ise/session-count'

module CiscoISE


  #
  # Make an Active Count API call
  #
  # #Parameters
  # session<CiscoISE::HttpSession>::  The ISE http session that the API call should be made against
  #
  # @examples
  #   #Create session
  #   ise_session   = CiscoISE::HttpSession.new("device-name","myusername","mypassword")
  #
  #   #Access the count
  #   count = CiscoISE::ActiveCountApi.new(ise_session).count
  #

  class ActiveCountApi  < CommonCount

    def initialize(session)
      super(session, 'Session/ActiveCount')
    end

  end
end