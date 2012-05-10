module CiscoISE

  #
  # Make a Disconnect API call
  #
  # #Parameters
  # session<CiscoISE::HttpSession>::  The ISE http session that the API call should be made against
  #
  # @examples
  #   #Create session
  #   ise_session   = CiscoISE::HttpSession.new("device-name","myusername","mypassword")
  #
  #   #Get a list of active users
  #   auth        = CiscoISE::AuthListApi.new(ise_session)
  #
  #   #Reauth a specific user
  #   active.each do |record|
  #     if record.user_name == 'someuser'
  #       puts "Ooops, something went wrong" unless CiscoISE::DisconnectApi.new(ise_session).bounce(record).success?
  #   end
  #
  class DisconnectApi < Coa

    #
    # Disconnect type DYNAMIC_AUTHZ_PORT_DEFAULT = 0
    #
    def default(active)
      type_zero(active, :disconnect)
      self
    end

    #
    # Disconnect type DYNAMIC_AUTHZ_PORT_BOUNCE = 1
    #
    def bounce(active)
      type_one(active, :disconnect)
      self
    end

    #
    # Disconnect type DYNAMIC_AUTHZ_PORT_SHUTDOWN = 2
    #
    def shutdown(active)
      type_two(active, :disconnect)
      self
    end

  end
end