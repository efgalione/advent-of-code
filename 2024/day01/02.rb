#! /usr/bin/env ruby
require 'awesome_print'
require 'byebug'

input_file = File.read('day01/input.txt')

location_lefts = File.read('day01/input_init.txt').chomp.gsub(/(\d*) \d*/,'\1').split("\n").map(&:to_i).sort
location_rights = File.read('day01/input_init.txt').chomp.gsub(/\d* (\d*)/,'\1').split("\n").map(&:to_i).sort

locations = location_lefts.map do |location| 
    location * location_rights.count(location)
end

puts locations.sum