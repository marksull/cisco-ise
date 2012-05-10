require 'cisco-ise/product'

module CiscoISE

  #
  # Make a Version API call and return a Product object
  #
  # #Parameters
  # session<CiscoISE::HttpSession>::  The ISE http session that the API call should be made against
  #
  # @examples
  #   #create session
  #   ise_session   = CiscoISE::HttpSession.new("device-name","myusername","mypassword")
  #
  #   #issue version API call and retrieve the product
  #   product = CiscoISE::VersionApi.new(ise_session).product
  #
  #   #work with the parsed XML data
  #   puts product.name
  #   puts product.type_of_node
  #   puts product.version
  #   puts product.type_of_node_as_code
  #
  #   #view the raw XML
  #   puts product.xml.to_s
  #

  class VersionApi < CommonElement

    def initialize(session)
      @xml = session.call_api('Version')
      self
    end

    #
    # Parse the api response and return a product object
    #
    def product
      CiscoISE::Product.new(@xml.elements['product'])
    end

  end
end