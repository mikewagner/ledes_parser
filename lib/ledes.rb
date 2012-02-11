require 'ledes/parser'

module Ledes

  class << self

    def parse(input)
      Ledes::Parser.new(input)
    end

  end


end
