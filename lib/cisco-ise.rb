#
# =CiscoISE
#
# A Ruby wrapper around the Cisco ISE 1.1 API
#
# Package::   CiscoISE
# Author::    Mark Sullivan (mark@sullivans.id.au)
# License::   MIT
#
#--
#
#++

module CiscoISE

  NAME            = "CiscoISE"
  GEM             = "cisco-ise"
  AUTHORS         = ["Mark Sullivan <mark@sullivans.id.au>"]

  #
  # Common class inherited by all API classes that return a list of results.
  #
  class CommonList

    #
    # Response from HttpSession stored in XML
    #
    attr_reader :xml

    #
    # Initialize the object by calling the api and recording the response
    #
    def initialize(session, api)
      @xml = session.call_api(api)
    end

    #
    # Each method used to iterate through each XML list. Each list item is identified by xpath.
    # For each list item, the nominated class is called which in turn parses the XML children and yields the object.
    #
    def each(xpath, class_to_call)
      @xml.elements.each(xpath) do |element|
        yield class_to_call.new(element)
      end
    end

    #
    # locate a specific element and parse the XML children and return the nominated object
    #
    def find(xpath, class_to_call)
      class_to_call.new(@xml.elements[xpath])
    end

  end

  #
  # Common class inherited by all API classes that return a session-count based XML object
  #
  class CommonCount < CommonList

    #
    # Overrides the each iterator with the session count xpath. In reality this should not be required
    # as there should always be only one result.
    #
    def each
      super("/sessionCount",CiscoISE::SessionCount)
    end

    #
    # Convenience method to directly extract and return the count value
    #
    def count
      find("/sessionCount",CiscoISE::SessionCount).count
    end
  end

  #
  # Common class inherited by all API classes that return a session-parameters based XML object
  #
  class CommonSession < CommonList
    #
    # Overrides the each iterator with the session parameters xpath.
    #
    def each
      super('/sessionParameters',CiscoISE::SessionParameters)
    end
  end

  #
  # Common class inherited by all data storage classes used to parse the XML attributes and elements
  #
  class CommonElement

    #
    # Response from HttpSession stored in XML
    #
    attr_reader :xml

    #
    # Store the XML document and parse
    #
    def initialize(xml)
      @xml = xml
      return if xml.nil?
      parse_xml
    end

    private

    #
    # Parse both the attributes and child elements
    #
    def parse_xml
      parse_attributes
      parse_elements
    end # parse_xml

    #
    # Some of the ISE data is stored as an attribute in the root element. Extract the attribute name and value and
    # store as a instance variable, if an accessor was defined for the variable
    #
    def parse_attributes
      @xml.attributes.each do |key, value|
        self.send(key + '=', value) if self.respond_to? key
      end
    end

    #
    # Extract the element name and value and store as a instance variable, if an accessor was defined for the variable
    #
    def parse_elements
      @xml.each do  |element|
        self.send(element.name + '=', element.text) if self.respond_to? element.name
      end
    end
  end

  class Version
      MAJOR = 0
      MINOR = 0
      PATCH = 1
      BUILD = 'rc1'

      STRING = [MAJOR, MINOR, PATCH].compact.join('.')
  end
end

require 'cisco-ise/failure-reasons-api'
require 'cisco-ise/active-list-api'
require 'cisco-ise/coa'
require 'cisco-ise/disconnect-api'
require 'cisco-ise/reauth-api'
require 'cisco-ise/http-session'
require 'cisco-ise/version-api'
require 'cisco-ise/auth-status-api'
require 'cisco-ise/active-count-api'
require 'cisco-ise/posture-count-api'
require 'cisco-ise/profiler-count-api'
require 'cisco-ise/mac-address-api'
require 'cisco-ise/user-name-api'
require 'cisco-ise/nas-ip-address-api'
require 'cisco-ise/end-point-ip-address-api'
require 'cisco-ise/auth-list-api'
require 'cisco-ise/acct-status-api'
require 'cisco-ise/delete-api'