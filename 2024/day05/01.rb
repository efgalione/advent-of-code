#! /usr/bin/env ruby
require 'awesome_print'
require 'byebug'

input_file = File.read('day05/input.txt')
input = input_file.split("\n\n")

rules = input[0].chomp.gsub(/(\d*)\|(\d*)/,'\1 \2').split("\n").map { |rule| rule.split.map(&:to_i) }
updates = input[1].split("\n").map { |update| update.split(',').map(&:to_i) }

updates_expanded = []

updates.each do |update|
  update_expanded_cases = []
  update.each_with_index do |element, index|
    update_expanded = []
    (index + 1...update.length).each do |j|
      update_expanded << "#{element},#{update[j]}"
    end
    update_expanded_cases << update_expanded.map { |update| update.split(',').map(&:to_i) }
  end
  updates_expanded << update_expanded_cases
end

valid_updates = []

updates_expanded.each_with_index do |update, index|
  valid_updates << updates[index] if update.all? { |u| u.all? { |pair| rules.include?(pair) }  }
end

total = 0
valid_updates.each do |update|
  total = total +  update[update.length / 2]
end

ap total