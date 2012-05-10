require './helper.rb'

class TestActiveSession < MiniTest::Unit::TestCase

  def test_active_session

    session = CiscoISE::ActiveSession.new(get_active_session_xml)

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