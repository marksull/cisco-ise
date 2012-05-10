require 'cisco-ise/session-count'

module CiscoISE

  #
  # Make a Posture Count API call
  #
  # #Parameters
  # session<CiscoISE::HttpSession>::  The ISE http session that the API call should be made against
  #
  # @examples
  #   #Create session
  #   ise_session   = CiscoISE::HttpSession.new("device-name","myusername","mypassword")
  #
  #   #Access the count
  #   count = CiscoISE::ProstureCountApi.new(ise_session).count
  #
  class PostureCountApi  < CommonCount

    def initialize(session)
      super(session, 'Session/PostureCount')
    end

  end
end