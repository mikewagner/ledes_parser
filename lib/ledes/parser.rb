module Ledes
  class Parser

    FORMAT = 'LEDES1998B'

    HEADERS = [
      'INVOICE_DATE',
      'INVOICE_NUMBER',
      'CLIENT_ID',
      'LAW_FIRM_MATTER_ID',
      'INVOICE_TOTAL',
      'BILLING_START_DATE',
      'BILLING_END_DATE',
      'INVOICE_DESCRIPTION',
      'LINE_ITEM_NUMBER',
      'EXP/FEE/INV_ADJ_TYPE',
      'LINE_ITEM_NUMBER_OF_UNITS',
      'LINE_ITEM_ADJUSTMENT_AMOUNT',
      'LINE_ITEM_TOTAL',
      'LINE_ITEM_DATE',
      'LINE_ITEM_TASK_CODE',
      'LINE_ITEM_EXPENSE_CODE',
      'LINE_ITEM_ACTIVITY_CODE',
      'TIMEKEEPER_ID',
      'LINE_ITEM_DESCRIPTION',
      'LAW_FIRM_ID',
      'LINE_ITEM_UNIT_COST',
      'TIMEKEEPER_NAME',
      'TIMEKEEPER_CLASSIFICATION',
      'CLIENT_MATTER_ID'
    ]

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
      format = contents.shift
      raise InvalidFormat, 'File contains incorrect format specification' unless format == FORMAT
      header = contents.shift
      raise InvalidHeader, 'File contains invalid header information'  unless header == HEADERS.join('|')
      contents.map { Ledes::Entry.new }
    end

    def contents
      @lines ||= begin
        lines = @input.respond_to?(:read) ? @input.read : @input
        lines.gsub(/\n|\r/, '')
        lines.split('[]').map(&:strip).delete_if { |l| l.empty? }
      end
    end

  end
end
