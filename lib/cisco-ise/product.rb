module CiscoISE
  #
  # Class to store parsed data from a Version API call. Refer to version-api.rb for usage examples.
  #
  class Product < CommonElement

    attr_accessor :name, :version, :type_of_node

    #
    # return the node type using the ISE defined mnemonics
    #
    def type_of_node_as_code
      %w[STANDALONE_MNT_NODE ACTIVE_MNT_NODE BACKUP_MNT_NODE NOT_AN_MNT_NODE][@type_of_node.to_i] ||= "Unknown node value of #{@type_of_node}"
    end
  end
end