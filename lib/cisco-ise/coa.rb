module CiscoISE

  #
  # Generic class to be inherited by any class performing CoA functionality.
  # Refer to disconnect-api.rb and reauth-api.rb for usage examples.
  #
  class Coa < CommonElement

    def initialize(session)
      @session = session
      self
    end

    def success?
      success = @xml.elements["//results"]
      success.nil? ? false : success.text == 'true'
    end

    private

    #
    # Perform a type zero reauth or disconnect
    #
    def type_zero(active, method)
      coa(active, method, 0)
      self
    end

        #
    # Perform a type one reauth or disconnect
    #
    def type_one(active, method)
      coa(active, method, 1)
      self
    end

    #
    # Perform a type two reauth or disconnect
    #
    def type_two(active, method)
      coa(active, method, 2)
      self
    end

    #
    # Construct and execute the CoA API call
    #
    def coa(active, method, type)
      @xml = @session.call_api("CoA/#{method == :reauth ? 'ReauthApi' : 'DisconnectApi'}/#{active.server}/#{active.calling_station_id}/#{type.to_s}")
    end


  end
end