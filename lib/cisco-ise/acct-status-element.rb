module CiscoISE

  #
  # Class to store parsed data from a AcctStatusElement objects. Refer to acct-status-api.rb for usage examples.
  #
  class AcctStatusElement  < CommonElement
    attr_accessor :calling_station_id,
                  :audit_session_id,
                  :paks_in,
                  :paks_out,
                  :bytes_in,
                  :bytes_out,
                  :session_time,
                  :username,
                  :server
  end
end