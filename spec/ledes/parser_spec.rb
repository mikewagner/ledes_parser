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

  describe "#map_line_to_headers" do

    let (:line) {
      [ '19990225',
        '96542',
        '00711',
        '0528',
        '700',
        '19990101',
        '19990131',
        'For services rendered',
        '1',
        'F',
        '2.00',
        '0',
        '700',
        '19990115',
        'L510',
        '',
        'A102',
        '22547',
        'Research attorney\'s fees, Trial pleading',
        '24-6437381',
        '350','Arnsley, Robert',
        'PT',
        '423-987' ]
    }

    it "should split the line and map values to headers" do
      parser = Ledes::Parser.new ''
      result = parser.map_line_to_headers(line.join('|'))
      result.keys.each_with_index do |key, index|
        result[key].should == line[index]
      end
    end


  end

  describe "#parse" do
 
    context "invalid input" do

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

    context "valid input" do

      let(:file) { fixture(:ledes_single_line_item) }

      it "should return array of entries" do
        entry = Ledes::Entry.new
        Ledes::Entry.stub(:new).and_return(entry)
        Ledes::Parser.new(file).parse.should == [entry]
      end

    end

  end

end
