require 'cisco-ise/active-session'

module CiscoISE

  #
  # Make an Auth List API call
  #
  # #Parameters
  # session<CiscoISE::HttpSession>::  The ISE http session that the API call should be made against
  # start_time<String>:: Limits the auth list query by a time
  # end_time<String>:: Limits the auth list query by a time
  #
  # @examples
  #   #Create session
  #   ise_session   = CiscoISE::HttpSession.new("device-name","myusername","mypassword")
  #
  #   #Create and Auth List query
  #   auth = CiscoISE::AuthListApi.new(ise_session)
  #
  #   #Iterate through each auth status
  #   auth.each do |record|
  #     puts record.user_name
  #   end
  #
  class AuthListApi < CommonList

    def initialize(session, start_time = nil, end_time = nil)
      super(session, "Session/AuthList/#{start_time ? start_time : 'null'}/#{end_time ? end_time : 'null'}")
    end

    def each
      super("*/activeSession",CiscoISE::ActiveSession)
    end

  end
end