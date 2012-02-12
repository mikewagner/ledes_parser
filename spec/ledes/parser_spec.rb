require 'helper'
require 'ledes/parser'
require 'ledes/exceptions'

describe Ledes::Parser do

  describe ".new" do

  end

  describe "#contents" do

    let(:file) { fixture(:ledes) }

    context "from file" do

      before do
        @parser = Ledes::Parser.new( file )
      end

      it "should return contents as array" do
        @parser.contents.should be_instance_of Array
      end

      it "should return format specification as first element" do
        @parser.contents.first.should == 'LEDES1998B'
      end

    end

    context "from string" do

      before do
        string = "LEDES1998B[]INVOICE_DATE|INVOICE_NUMBER|CLIENT_ID[] "
        @parser = Ledes::Parser.new( string )
      end

      it "should return lines formatted as array" do
        @parser.contents.should == ['LEDES1998B', 'INVOICE_DATE|INVOICE_NUMBER|CLIENT_ID']
      end


    end

  end

  describe "#parse" do
   
    it "should raise error when file contains invalid format" do
      file = fixture(:ledes_with_invalid_format)
      @parser = Ledes::Parser.new( file )
      lambda {
        @parser.parse
      }.should raise_error(Ledes::InvalidFormat)
    end

    it "should raise error when file contains invalid headers" do
      file = fixture(:ledes_with_invalid_headers)
      @parser = Ledes::Parser.new( file )
      lambda {
        @parser.parse
      }.should raise_error(Ledes::InvalidHeader)
    end

  end

end
