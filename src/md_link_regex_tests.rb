#!/usr/bin/ruby

#---------------------------------------------------------#
#   This script tests either a default set of strings or  #
#   any passed in arguments to see if they match standard #
#   markdown link syntax. I primarily wrote this to try   #
#   and get a better handle on ruby regular expressions   #
#   so there are two versions of each regex a character   #
#   escaped version and a %r version.                     #
#         Author: Travis McClellen                        #
#---------------------------------------------------------#

require 'colorize'

def print_regex_result(regex_description, location)
  if(location.nil?)
    puts "#{regex_description} not found".red
  else
    puts "#{regex_description} version found at #{location}".green
  end
end

def check_for_links(line)
  puts line.blue
  first = (line =~ /\[\w*\]/) 
  second = (line =~ /\(http:\/\/|https:\/\/.*\)/)
  third = (line =~ %r{\[([^\]]+)\]})
  fourth = (line =~ %r{\((http://|https://).*\)})
  complete = (line =~ %r{\[([^\]]+)\]\((http://|https://).*\)}x)

  print_regex_result "link name escaped", first
  print_regex_result "link address escaped", second
  print_regex_result "link name %r", third
  print_regex_result "link address %r", fourth
  print_regex_result "complete %r", complete
  return true if complete
  false
end

def test_string(line)
  puts "result = #{check_for_links(line)}\n".yellow
end

# Begin Execution #

if(ARGV.empty?) then
  test_string('[this](http://www.example.org)')
  test_string('[not]')
  test_string('(https://alsonot.com)')
  test_string('[a](shouldntwork)')
  test_string('[linktwo](https://example.net)')
  test_string('test text to start [link](http://example.com)')
else
  ARGV.each do |arg|
    test_string arg 
  end
end