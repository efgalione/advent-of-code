#! /usr/bin/env ruby
require 'awesome_print'
require 'byebug'

location_lefts = File.read('day01/input.txt').chomp.gsub(/(\d*) \d*/,'\1').split("\n").map(&:to_i).sort
location_rights = File.read('day01/input.txt').chomp.gsub(/\d* (\d*)/,'\1').split("\n").map(&:to_i).sort

locations = location_lefts.zip(location_rights).map{ |location| (location[0] - location[1]).abs}

puts locations.sum
