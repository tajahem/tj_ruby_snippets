#!/usr/bin/ruby

#  A simple test comparing run times for regualar loops versus unwrapped loops
#	Author: Travis McClellen

def loop_test
	start = Time.now
	n = 5
	20.times do 
		n *= n
	end
	Time.now - start
end

def unwrapped_test
	start = Time.now
	n = 5	
	n*=n
	n*=n
	n*=n
	n*=n
	n*=n
	n*=n # 6
	n*=n
	n*=n
	n*=n
	n*=n
	n*=n # 11
	n*=n
	n*=n
	n*=n
	n*=n
	n*=n
	n*=n
	n*=n
	n*=n
	n*=n # 36 - 17 
	Time.now - start
end

def get_milli(time)
	(time * 1000).round(4)
end

# Begin Execution #

first_total = 0
second_total = 0

5.times do
	first = loop_test
	first_total += first
	second = unwrapped_test
	second_total += second
	puts "#{get_milli first}ms loop --- #{get_milli second}ms unwrapped"
end

first_average = first_total / 5
second_average = second_total / 5

puts "loop #{get_milli first_average}ms average"
puts "unwrapped #{get_milli second_average}ms average"
if first_average - second_average >= 0
	puts "unwrapped faster by #{get_milli (first_average - second_average)}ms"
else
	puts "loop faster by #{get_milli (second_average - first_average)}ms"
end