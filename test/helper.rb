require 'rubygems'
require 'minitest/autorun'
require 'minitest/reporters'
require 'rexml/document'

MiniTest::Unit.runner = MiniTest::SuiteRunner.new
MiniTest::Unit.runner.reporters << MiniTest::Reporters::RubyMineReporter.new

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'cisco-ise'

class MiniTest::Unit::TestCase
  def setup
    @name                   = 'Cisco Identity Services Engine'
    @version                = '1.1.0.665'
    @type_of_node_good      = '1'
    @type_of_node_good_code = 'ACTIVE_MNT_NODE'
    @type_of_node_bad       = '111'
    @type_of_node_bad_msg   = "Unknown node value of #@type_of_node_bad"
    @user_name               = 'username'
    @calling_station_id     = '00:17:AB:CD:EF:GH'
    @nas_ip_address         = '1.1.1.1'
    @acct_session_id        = '00000002'
    @audit_session_id       = '0A43D4A5000000010006581C'
    @server                 = 'ise1'
    @framed_ip_address      = '2.2.2.2'
    @passed                 = 'true'
    @failed                 = 'false'
    @nas_port               = '50147'
    @identity_group         = ''
    @network_device_name		= ''
    @acs_server		          = ''
    @framed_ip_address		  = ''
    @network_device_groups	= ''
    @access_service         = ''
    @acs_timestamp          = ''
    @authentication_method  = ''
    @execution_steps        = ''
    @audit_session_id       = ''
    @nas_port_id            = ''
    @nac_policy_compliance  = ''
    @selected_azn_profiles  = ''
    @service_type           = ''
    @message_code           = ''
    @destination_ip_address = ''
    @nas_port_type          = ''
    @id                     = ''
    @acsview_timestamp      = ''
    @acs_session_id         = ''
    @service_selection_policy = ''
    @authorization_policy   = ''
    @identity_store         = ''
    @response               = ''
    @use_case               = ''
    @cisco_av_pair          = ''
    @acs_username           = ''
    @radius_username        = ''
    @authentication_identity_store = ''
    @response_time          = ''
    @other_attributes       = ''


    @xml_failure_reasons    = "<?xml version='1.0' encoding='UTF-8' standalone='yes'?><failureReasonList><failureReason id='100001'><code>100001 AUTHMGR-5-FAIL Authorization failed for client</code><cause>This may or may not be indicating a violation</cause><resolution>Please review and resolve according to your organization's policy</resolution></failureReason><failureReason id='100002'><code>100002 AUTHMGR-5-SECURITY_VIOLATION Security violation on the interface</code><cause>This may or may not be indicating a violation</cause><resolution>Please review and resolve according to your organization's policy</resolution></failureReason></failureReasonList>"
    @xml_active_session     = "<activeSession><user_name>#@user_name</user_name><calling_station_id>#@calling_station_id</calling_station_id><nas_ip_address>#@nas_ip_address</nas_ip_address><acct_session_id>#@acct_session_id</acct_session_id><audit_session_id>#@audit_session_id</audit_session_id><server>#@server</server><framed_ip_address>#@framed_ip_address</framed_ip_address></activeSession>"
    @xml_auth_status        = "<authStatusElements><passed xsi:type='xs:boolean' xmlns:xs='http://www.w3.org/2001/XMLSchema' xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance'>#@passed</passed><failed xsi:type='xs:boolean' xmlns:xs='http://www.w3.org/2001/XMLSchema' xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance'>#@failed</failed><user_name>#@user_name</user_name><nas_ip_address>#@nas_ip_address</nas_ip_address><calling_station_id>#@calling_station_id</calling_station_id><nas_port>#@nas_port</nas_port><network_device_name>DefaultNetworkDevice</network_device_name><acs_server>itdelab-guest-ise1</acs_server><eap_authentication>Lookup</eap_authentication><network_device_groups>Device Type#All Device Types,Location#All Locations</network_device_groups><access_service>Default Network Access</access_service><acs_timestamp>2012-05-08T05:42:21.409Z</acs_timestamp><authentication_method>mab</authentication_method><execution_steps>11001,11017,11049,11027,15008,15048,15048,15004,15041,15006,15013,24209,24217,22056,22058,22060,15036,15004,15016,11022,11002</execution_steps><audit_session_id>0A43D4A500000019208676B7</audit_session_id><nas_port_id>FastEthernet1/0/47</nas_port_id><nac_policy_compliance>Pending</nac_policy_compliance><selected_azn_profiles>GUEST_WEB_AUTH</selected_azn_profiles><service_type>Call Check</service_type><message_code>5200</message_code><destination_ip_address>10.67.55.13</destination_ip_address><nas_port_type>Ethernet</nas_port_type><id>1334899248841929</id><acsview_timestamp>2012-05-08T05:42:21.410Z</acsview_timestamp><acs_session_id>itdelab-guest-ise1/124273790/406</acs_session_id><service_selection_policy>MAB</service_selection_policy><authorization_policy>Default</authorization_policy><response>{User-Name=00-17-F2-CD-C0-83; State=ReauthSession:0A43D4A500000019208676B7; Class=CACS:0A43D4A500000019208676B7:itdelab-guest-ise1/124273790/406; Termination-Action=RADIUS-Request; cisco-av-pair=url-redirect-acl=ACL-WEBAUTH-REDIRECT; cisco-av-pair=url-redirect=https://itdelab-guest-ise1.cisco.com:8443/guestportal/gateway?sessionId=0A43D4A500000019208676B7&amp;action=cwa; cisco-av-pair=ACS:CiscoSecure-Defined-ACL=#ACSACL#-IP-PERMIT_ALL_TRAFFIC-4f57e406; }</response><use_case>Host Lookup</use_case><cisco_av_pair>audit-session-id=0A43D4A500000019208676B7</cisco_av_pair><acs_username>00:17:F2:CD:C0:83</acs_username><radius_username>00:17:F2:CD:C0:83</radius_username><selected_identity_store>Internal Endpoints</selected_identity_store><identity_policy_matched_rule>Default</identity_policy_matched_rule><response_time>8</response_time><other_attributes>ConfigVersionId=14,DestinationPort=1645,Protocol=Radius,Framed-MTU=1500,EAP-Key-Name=,cisco-nas-port=FastEthernet1/0/47,CPMSessionID=0A43D4A500000019208676B7,EndPointMACAddress=00-17-F2-CD-C0-83,Device Type=Device Type#All Device Types,Location=Location#All Locations,Device IP Address=10.67.212.165,Called-Station-ID=00:13:1A:73:5E:B3</other_attributes></authStatusElements>"
    @xml_active_count       = "<?xml version='1.0' encoding='UTF-8' standalone='yes'?><sessionCount><count>1</count></sessionCount>"

  end

  def get_rexml_root(xml)
    REXML::Document.new(xml).root
  end
  def get_product_xml(node)
    get_rexml_root("<product name='#@name'><version>#@version</version><type_of_node>#{node}</type_of_node></product>")
  end

  def get_active_session_xml
    get_rexml_root(@xml_active_session)
  end

end
