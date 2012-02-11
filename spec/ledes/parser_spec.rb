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
        @parser = Ledes::Parser.new( file.read )
      end

      it "should return contents as array" do
        @parser.read.should be_instance_of Array
      end

      it "should return format specification as first element" do
        @parser.read.first.should == 'LEDES1998B'
      end


    end


  end


end
