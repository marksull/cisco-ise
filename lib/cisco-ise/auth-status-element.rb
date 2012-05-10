module CiscoISE

  #
  # Class to store parsed data from a AuthStatusElement objects. Refer to auth-status-api.rb for usage examples.
  #
  class AuthStatusElement  < CommonElement
    attr_accessor :passed, :failed, :user_name, :nas_ip_address, :calling_station_id, :nas_port, :identity_group,
                  :network_device_name, :acs_server, :framed_ip_address, :network_device_groups, :access_service,
                  :acs_timestamp, :authentication_method, :execution_steps, :audit_session_id, :nas_port_id,
                  :nac_policy_compliance, :selected_azn_profiles, :service_type, :message_code, :destination_ip_address,
                  :nas_port_type, :id, :acsview_timestamp, :acs_session_id, :service_selection_policy, :authorization_policy,
                  :identity_store, :response, :use_case, :cisco_av_pair, :acs_username, :radius_username,
                  :authentication_identity_store,:response_time, :other_attributes
  end # AuthStatusElement
end