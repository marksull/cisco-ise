module CiscoISE

  #
  # Make a Reauth API call
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
  #       puts "Ooops, something went wrong" unless CiscoISE::ReauthApi.new(ise_session).rerun(record).success?
  #   end
  #
  class ReauthApi < Coa

    #
    # Reauth type REAUTH_TYPE_DEFAULT = 0
    #
    def default(active)
      type_zero(active, :reauth)
      self
    end

    #
    # Reauth type REAUTH_TYPE_LAST = 1
    #
    def last(active)
      type_one(active, :reauth)
      self
    end

    #
    # Reauth type REAUTH_TYPE_RERUN = 2
    #
    def rerun(active)
      type_two(active, :reauth)
      self
    end

  end
end