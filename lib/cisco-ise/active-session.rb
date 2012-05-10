module CiscoISE

  #
  # Class to store parsed data from a ActiveSession objects. Refer to active-list-api.rb for usage examples.
  #
  class ActiveSession < CommonElement
    attr_accessor :user_name, :nas_ip_address, :server, :calling_station_id,
                  :acct_session_id, :audit_session_id, :framed_ip_address
  end
end