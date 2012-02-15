require 'helper'
require 'ledes/entry'

describe Ledes::Entry do

  describe ".new" do
    
    it "should assign attributes" do
      date  = Time.now.strftime('%Y%m%d')
      entry = Ledes::Entry.new({:invoice_date => date})
      entry.invoice_date.should == date
    end

  end

end
