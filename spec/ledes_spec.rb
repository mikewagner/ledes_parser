require 'helper'

describe Ledes do

  describe ".parse" do
  
    it "should return Ledes::Parser" do
      Ledes.parse('foo').should be_instance_of Ledes::Parser
    end

  end

end
