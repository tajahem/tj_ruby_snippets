# Ruby Snippets

A collection of simple ruby programs mostly written as stand alone tests for some idea or proof of concept.

# first_recuring_character

usage:

	first_recuring_character.rb test_string_1 [test_string_2 ...]
	
Finds the first recuring character in a string. Can be supplied with multiple test strings either as arguments or piped in input. It uses both an in place and set based solutions and times both approaches outputing an average time for each at completion. 

# loop_unwrap_test

A self contained test with no input parameters that test the execution time of a loop versus a lot of copy paste. _(spoiler: unwrapping loops tends to be faster)_

# md_link_regex_tests

**requires [colorize](https://github.com/fazibear/colorize)**

usage:

	md_link_regex_tests.rb [test_link ...]

Tests either a set of default strings or any arguments supplied to determine if they are a markdown style link. 
	
	[link name](valid website address)
	
A number of tests are run using various regular expressions and the output of each test is color coded for easier parsing. 

# randomstrings

 usage:
 
 	randomstrings.rb filename number_of_strings
 
Creates a file of randomized 40 character strings. Requires a filename and the number of strings you would like generated.
