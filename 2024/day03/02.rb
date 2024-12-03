#! /usr/bin/env ruby
require 'awesome_print'
require 'byebug'

input_file = File.read('day03/input.txt')

pattern = /(do)\(\)|(don)\'t\(\)|mul\((\d{1,3}),(\d{1,3})\)/m
matches = input_file.scan(pattern)

sum = 0
is_do = true
matches.each do |match|
  if match[0] == 'do'
    is_do = true
  end

  if match[1] == 'don'
    is_do = false
  end

  if is_do
    sum += match[2].to_i * match[3].to_i
  end

end

ap sum