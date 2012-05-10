
module CiscoISE

  #
  # Class to store parsed data from APIs returning a SessionParameter object. Refer to end-point-ip-address-api.rb,
  # mac-address-api.rb and nas-ip-address-api.rb for usage examples.
  #
  class SessionParameters < CommonElement
    attr_accessor :passed,
                  :failed,
                  :user_name,
                  :nas_ip_address,
                  :failure_reason,
                  :calling_station_id,
                  :nas_port,
                  :identity_group,
                  :network_device_name,
                  :acs_server,
                  :authen_protocol,
                  :framed_ip_address,
                  :network_device_groups,
                  :access_service,
                  :auth_acs_timestamp,
                  :authentication_method,
                  :execution_steps,
                  :radius_response,
                  :audit_session_id,
                  :nas_identifier,
                  :nas_port_id,
                  :nac_policy_compliance,
                  :auth_id,
                  :auth_acsview_timestamp,
                  :message_code,
                  :acs_session_id,
                  :service_selection_policy,
                  :authorization_policy,
                  :identity_store,
                  :response,
                  :service_type,
                  :cts_security_group,
                  :use_case,
                  :cisco_av_pair,
                  :ad_domain,
                  :acs_username,
                  :radius_username,
                  :nac_role,
                  :nac_username,
                  :nac_posture_token,
                  :nac_radius_is_user_auth,
                  :selected_posture_server,
                  :selected_identity_store,
                  :authentication_identity_store,
                  :azn_exp_pol_matched_rule,
                  :ext_pol_server_matched_rule,
                  :grp_mapping_pol_matched_rule,
                  :identity_policy_matched_rule,
                  :nas_port_type,
                  :query_identity_stores,
                  :selected_azn_profiles,
                  :sel_exp_azn_profiles,
                  :selected_query_identity_stores,
                  :eap_tunnel,
                  :tunnel_details,
                  :cisco_h323_attributes,
                  :cisco_ssg_attributes,
                  :other_attributes,
                  :response_time,
                  :nad_failure,
                  :destination_ip_address,
                  :acct_id,
                  :acct_acs_timestamp,
                  :acct_acsview_timestamp,
                  :acct_session_id,
                  :acct_status_type,
                  :acct_session_time,
                  :acct_input_octets,
                  :acct_output_octets,
                  :acct_input_packets,
                  :acct_output_packets,
                  :acct_class,
                  :acct_terminate_cause,
                  :acct_multi_session_id,
                  :acct_authentic,
                  :termination_action,
                  :session_timeout,
                  :idle_timeout,
                  :acct_interim_interval,
                  :acct_delay_time,
                  :event_timestamp,
                  :acct_tunnel_connection,
                  :acct_tunnel_packet_lost,
                  :security_group,
                  :cisco_h323_setup_time,
                  :cisco_h323_connect_time,
                  :cisco_h323_disconnect_time,
                  :framed_protocol,
                  :started,
                  :stopped,
                  :ckpt_id,
                  :type,
                  :nad_acsview_timestamp,
                  :vlan,
                  :dacl,
                  :authentication_type,
                  :interface_name,
                  :reason,
                  :endpoint_policy
  end
end