module Ledes
  class Parser

    FORMAT = 'LEDES1998B'

    HEADERS = {
      :invoice_date => 'INVOICE_DATE',
      :invoce_number => 'INVOICE_NUMBER',
      :client_id => 'CLIENT_ID',
      :law_firm_matter_id => 'LAW_FIRM_MATTER_ID',
      :invoice_total => 'INVOICE_TOTAL',
      :billing_start_date => 'BILLING_START_DATE',
      :billing_end_date => 'BILLING_END_DATE',
      :invoice_description => 'INVOICE_DESCRIPTION',
      :line_item_number => 'LINE_ITEM_NUMBER',
      :exp_fee_inv_adj_type => 'EXP/FEE/INV_ADJ_TYPE',
      :line_item_number_of_units => 'LINE_ITEM_NUMBER_OF_UNITS',
      :line_item_adjustment_amount => 'LINE_ITEM_ADJUSTMENT_AMOUNT',
      :line_item_total => 'LINE_ITEM_TOTAL',
      :line_item_date => 'LINE_ITEM_DATE',
      :ine_item_task_code => 'LINE_ITEM_TASK_CODE',
      :line_item_expense_code => 'LINE_ITEM_EXPENSE_CODE',
      :line_item_activity_code => 'LINE_ITEM_ACTIVITY_CODE',
      :timekeeper_id => 'TIMEKEEPER_ID',
      :line_item_description => 'LINE_ITEM_DESCRIPTION',
      :law_firm_id => 'LAW_FIRM_ID',
      :line_item_unit_cost => 'LINE_ITEM_UNIT_COST',
      :timekeeper_name => 'TIMEKEEPER_NAME',
      :timekeeper_classification => 'TIMEKEEPER_CLASSIFICATION',
      :client_matter_id => 'CLIENT_MATTER_ID'
    }

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
      raise InvalidFormat, 'File contains incorrect format specification' unless valid_format?
      raise InvalidHeader, 'File contains invalid header information'  unless valid_header?
      entries = contents[2, contents.length].map do |line|
        Ledes::Entry.new map_line_to_headers(line)
      end
      entries
    end

    def contents
      @lines ||= begin
        lines = @input.respond_to?(:read) ? @input.read : @input
        lines.gsub!(/\n|\r/, '')
        lines.split('[]').map(&:strip).delete_if { |l| l.empty? }
      end
    end
  
    def valid_format?
      contents[0] == FORMAT
    end

    def valid_header?
      contents[1] == HEADERS.values.join('|')
    end


    def map_line_to_headers(line)
      Hash[HEADERS.keys.zip line.split('|')]
    end

  end
end
