#! /usr/bin/env ruby
require 'awesome_print'
require 'byebug'

input_file = File.read('day04/input.txt')

horizontal = input_file.split("\n")
horizontal_matrix = horizontal.map { |line| line.split("") }

matrix_length = horizontal_matrix.length

total = 0
(0...matrix_length).map do |i|
  (0...(matrix_length)).map do |j|
    if ((i-1) >=0 && (j-1) >=0 && (i+1) < matrix_length && (j+1) < matrix_length )
      ## it better to count that you have "2" Ms and "2" Ss in the diagonal of "A"
      if horizontal_matrix[i][j] == 'A'
          if horizontal_matrix[i-1][j-1] == 'M' && horizontal_matrix[i+1][j-1] == 'M' &&  horizontal_matrix[i-1][j+1] == 'S' && horizontal_matrix[i+1][j+1] == 'S' 
            total = total + 1
          end

          if horizontal_matrix[i-1][j-1] == 'S' && horizontal_matrix[i+1][j-1] == 'S' &&  horizontal_matrix[i-1][j+1] == 'M' && horizontal_matrix[i+1][j+1] == 'M' 
            total = total + 1
          end

          if horizontal_matrix[i-1][j-1] == 'M' && horizontal_matrix[i+1][j-1] == 'S' &&  horizontal_matrix[i-1][j+1] == 'M' && horizontal_matrix[i+1][j+1] == 'S' 
            total = total + 1
          end

          if horizontal_matrix[i-1][j-1] == 'S' && horizontal_matrix[i+1][j-1] == 'M' &&  horizontal_matrix[i-1][j+1] == 'S' && horizontal_matrix[i+1][j+1] == 'M' 
            total = total + 1
          end
      end      
    end
  end
end 

ap total