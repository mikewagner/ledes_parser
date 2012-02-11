module Ledes
  class Parser

    attr_accessor :input

    class << self
      
      def parse(input)
        parser = new(input)
        parser.parse
        parser 
      end

    end

    def initialize(input)
      @input = input
    end

    def parse

    end


    def read
      @lines ||= begin
        lines = @input.respond_to?(:read) ? @input.read : @input
        lines.gsub(/\n|\r/, '')
        lines.split('[]').map(&:strip).delete_if { |l| l.empty? }
      end
    end



  end
end
