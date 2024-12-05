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
invalid_updates = []

updates_expanded.each_with_index do |update, index|
  if update.all? { |u| u.all? { |pair| rules.include?(pair) }  }
    valid_updates << updates[index] 
  else
    invalid_updates << updates[index]
  end
end

invalid_updates.each do |update|
  index = 0
  # while index < update.length - 2
  #   unless rules.include?([update[index], update[index+1]]) 
  #     aux = update[index]
  #     update[index] = update[index+1]
  #     update[index+1] = aux
  #     index=0
  #   else
  #     index+=1  
  #   end
  
  # end

  update_pair = []
  (1...update.length).each do |i|
    update_pair << [update[i-1], update[i]]
  end

  while not (update_pair.all? { |pair| rules.include?(pair) } )
    # debugger
    if not (rules.include?([update[index], update[index+1]]))
      aux = update[index]
      update[index] = update[index+1]
      update[index+1] = aux

      index = 0
      update_pair = []
      (1...update.length).each do |i|
        update_pair << [update[i-1], update[i]]
      end

      ap update
    else
      index+=1  
    end
  end
end

# debugger


total = 0
invalid_updates.each do |update|
  total = total +  update[update.length / 2]
end

ap total