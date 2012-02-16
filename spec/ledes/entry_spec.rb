require 'helper'
require 'ledes/entry'

describe Ledes::Entry do

  describe "#attributes" do

    it "should return hash of attributes" do
      attrs = {
        :invoice_date => '20120101',
        :invoice_number => 999,
        :client_id => 123
      }
      entry = Ledes::Entry.new(attrs)
      entry.attributes.should == {
        :invoice_date => "20120101",
        :invoice_number => 999,
        :client_id => 123,
        :law_firm_matter_id => nil,
        :invoice_total => nil,
        :billing_start_date => nil,
        :billing_end_date => nil, 
        :invoice_description => nil, 
        :line_item_number => nil,
        :exp_fee_inv_adj_type => nil,
        :line_item_number_of_units => nil,
        :line_item_adjustment_amount => nil,
        :line_item_total => nil,
        :line_item_date => nil,
        :line_item_task_code => nil,
        :line_item_expense_code => nil,
        :line_item_activity_code => nil,
        :timekeeper_id => nil,
        :line_item_description => nil,
        :law_firm_id => nil,
        :line_item_unit_cost => nil,
        :time_keeper_name => nil,
        :time_keeper_classification => nil,
        :client_matter_id => nil
      }
    end

  end


  describe ".new" do
    
    it "should assign attributes" do
      date  = Time.now.strftime('%Y%m%d')
      entry = Ledes::Entry.new({:invoice_date => date})
      entry.invoice_date.should == date
    end

  end

end
