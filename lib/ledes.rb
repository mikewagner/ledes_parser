require 'ledes/parser'
require 'ledes/entry'
require 'ledes/exceptions'


module Ledes

  class << self

    def parse(input)
      Ledes::Parser.new(input)
    end

  end


end
