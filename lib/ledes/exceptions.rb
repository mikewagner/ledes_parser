module Ledes

  # raised when file or string contains the incorrect file format
  class InvalidFormat < StandardError; end

  # raised when file or string contains incorrect header information
  class InvalidHeader < StandardError; end

end
