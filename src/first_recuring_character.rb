#!/usr/bin/ruby

#   A simple program to find the first recuring character in a string. 
#   It does so doing first using an in-place solution and then a set based             
#   approach. Input strings can be supplied either as arguments or piped in.
#                       
#   Author: Travis McClellen

require 'set'

$in_place_times = Array.new
$set_times = Array.new

def find_first_recuring_character(input)
	current_char = 1;
	
	while current_char < input.length
		for i in 0..current_char - 1
			if input[i] == input[current_char]
				return input[i]
			end
		end	
		current_char += 1
	end
	
end

def find_using_set(input)
	characters = Set.new
	input.chars.to_a.each do |c|
		return c if (characters.add?(c).nil?)
	end
	return nil
end

def get_milli(time)
	(time * 1000).round(4)
end

def test_string(a)
	start = Time.now
	result = find_first_recuring_character a
	total_time = Time.now - start
	$in_place_times.push(total_time)
	start = Time.now
        second_result = find_using_set a
        second_total_time = Time.now - start
	$set_times.push(second_total_time)
        
        if(result != second_result)
            puts "Error: there is a problem parsing #{a}"
            return
        end
        
        puts "#{a}"
        puts "#{result}\n in place time = #{get_milli total_time}ms\n set time = #{get_milli second_total_time}ms"
end

def print_average(message, times)
	total = 0
	times.each do |time|
		total += time
	end

	puts "average #{message} times = #{get_milli(total / times.size)}"
end

# Begin Execution #

if !ARGV.empty?
	ARGV.each do |a|
		test_string a
	end
else
	ARGF.each do |a|
		test_string a
	end
end
puts '-------'
print_average('in place', $in_place_times)
print_average('set', $set_times)