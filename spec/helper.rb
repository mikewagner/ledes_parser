# encoding: utf-8
$:.unshift File.join( File.dirname(__FILE__), '..', 'lib' )

require 'ledes'


def fixture(name)
  File.new( File.join( File.dirname(__FILE__), "fixtures", "#{name}.txt" ) )
end

