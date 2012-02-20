#!/usr/bin/env ruby
$:.unshift File.join( File.dirname(__FILE__), 'lib' )

require 'ledes'

ledes = File.new( File.join( File.dirname(__FILE__), 'spec', 'fixtures', 'ledes.txt') ) 
entries = Ledes::Parser.parse( ledes ).entries

p entries

