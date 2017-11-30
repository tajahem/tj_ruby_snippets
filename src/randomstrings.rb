#!/usr/bin/ruby

# usage: randomstrings.rb <filename> <number of strings>
# creates a file of randomized 40 character strings

require 'securerandom'

open(ARGV[0], 'w'){ |file|
    ARGV[1].to_i.times do
        file.puts SecureRandom.base64(40)[0...-2]
    end
}