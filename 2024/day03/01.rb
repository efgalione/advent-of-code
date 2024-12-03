#! /usr/bin/env ruby
require 'awesome_print'
require 'byebug'

input_file = File.read('day03/input.txt')

pattern = /mul\((\d{1,3}),(\d{1,3})\)/m
matches = input_file.scan(pattern)

results = matches.map { |a, b| a.to_i * b.to_i }
sum = results.sum

ap sum