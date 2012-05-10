module CiscoISE
  #
  # Class to store parsed data from APIs returning a SessionCount object. Refer to active-count-api.rb,
  # profiler-count-api.rb and posture-count-api.rb for usage examples.
  #
  class SessionCount < CommonElement
    attr_accessor :count
  end
end