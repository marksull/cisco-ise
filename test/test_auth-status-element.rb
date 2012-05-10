require './helper.rb'

class TestAuthStatusElement < MiniTest::Unit::TestCase

  def test_auth_status_element

    session = CiscoISE::AuthStatusElement.new(get_auth_status_xml)

    # Let make sure all the data is parsed correctly
    assert_instance_of  CiscoISE::ActiveSession, session
    assert_equal        session.acct_session_id, @acct_session_id
    assert_equal        session.audit_session_id, @audit_session_id
    assert_equal        session.calling_station_id, @calling_station_id
    assert_equal        session.framed_ip_address, @framed_ip_address
    assert_equal        session.nas_ip_address, @nas_ip_address
    assert_equal        session.server, @server
    assert_equal        session.user_name, @user_name


  end

end