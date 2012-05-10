module CiscoISE
  #
  # Class to store parsed data from a FailureReason objects. Refer to failure-reason-api.rb for usage examples.
  #
  class FailureReason < CommonElement
    attr_accessor :id, :code, :cause, :resolution
  end
end