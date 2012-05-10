require 'cisco-ise/active-session'

module CiscoISE

  #
  # Make an Active List API call
  #
  # #Parameters
  # session<CiscoISE::HttpSession>::  The ISE http session that the API call should be made against
  #
  # @examples
  #   #Create session
  #   ise_session   = CiscoISE::HttpSession.new("device-name","myusername","mypassword")
  #
  #   #Create and Auth List query
  #   active = CiscoISE::ActiveListApi.new(ise_session)
  #
  #   #Iterate through each active status
  #   active.each do |record|
  #     puts record.user_name
  #   end
  #

  class ActiveListApi < CommonList

    def initialize(session)
      super(session, 'Session/ActiveList')
    end

    def each
      super("*/activeSession",CiscoISE::ActiveSession)
    end

  end
end