require 'helper'
require 'ledes/parser'

describe Ledes::Parser do

  describe ".new" do

  end

  describe "#read" do

    let(:file) { fixture(:ledes) }

    context "from file" do

      before do
        @parser = Ledes::Parser.new( file )
      end

      it "should return contents as array" do
        @parser.read.should be_instance_of Array
      end

      it "should return format specification as first element" do
        @parser.read.first.should == 'LEDES1998B'
      end

    end

    context "from string" do

      before do
        string = "LEDES1998B[]INVOICE_DATE|INVOICE_NUMBER|CLIENT_ID[] "
        @parser = Ledes::Parser.new( string )
      end

      it "should return contents as array" do
        @parser.read.should be_instance_of Array
      end

      it "should return format specification as first element" do
        @parser.read.should == ['LEDES1998B', 'INVOICE_DATE|INVOICE_NUMBER|CLIENT_ID']
      end


    end


  end


end
