#! /usr/bin/env ruby
require 'awesome_print'
require 'byebug'

input_file = File.read('day02/input.txt')

levels = input_file.split("\n").map { |line| line.split.map(&:to_i) }

safe_levels = []

levels.each do |level|
  length = level.length - 2

  temp_level = []
  
  (0..length).each do |i|
    num1 = level[i]
    num2 = level[i + 1]
    temp_level << (num1 - num2)
  end

  if temp_level.all? { |num| num.abs <= 3 } && (temp_level.all? { |num| num > 0 } || temp_level.all? { |num| num < 0 })
    safe_levels << temp_level 
  end 
end

puts safe_levels.count