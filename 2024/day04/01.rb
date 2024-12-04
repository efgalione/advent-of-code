#! /usr/bin/env ruby
require 'awesome_print'
require 'byebug'

input_file = File.read('day04/input.txt')

horizontal = input_file.split("\n")
horizontal_matrix = horizontal.map { |line| line.split("") }

vertical = horizontal_matrix.transpose.map(&:join)
matrix_length = horizontal_matrix.length

diagonals_down = (0...matrix_length).map do |i|
  (0...(matrix_length - i)).map do |j|
    horizontal_matrix[i + j][j]
  end.join
end + (1...matrix_length +1).map do |i|
  (0...(matrix_length - i +1)).map do |j|
    horizontal_matrix[j][i + j]
  end.join
end

diagonals_up = (0...matrix_length).map do |i|
  (0...(matrix_length - i)).map do |j|
    horizontal_matrix[matrix_length - 1 - i - j][j]
  end.join
end + (1...matrix_length+1).map do |i|
  (0...(matrix_length - i)+1).map do |j|
    horizontal_matrix[matrix_length - 1 - j][i + j]
  end.join
end

# diagonals_down.delete_at(0)
# diagonals_up.delete_at(0)

total_lines = horizontal + vertical + diagonals_down + diagonals_up

total = 0
total_lines.each do |line|
  total= total + line.scan(/XMAS/).length
  total= total + line.scan(/SAMX/).length
end

ap total