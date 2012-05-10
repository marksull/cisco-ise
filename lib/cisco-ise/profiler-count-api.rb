require 'cisco-ise/session-count'

module CiscoISE

  #
  # Make a Profiler Count API call
  #
  # #Parameters
  # session<CiscoISE::HttpSession>::  The ISE http session that the API call should be made against
  #
  # @examples
  #   #Create session
  #   ise_session   = CiscoISE::HttpSession.new("device-name","myusername","mypassword")
  #
  #   #Access the count
  #   count = CiscoISE::ProfilerCountApi.new(ise_session).count
  #
  class ProfilerCountApi  < CommonCount

    def initialize(session)
      super(session, 'Session/ProfilerCount')
    end

  end
end