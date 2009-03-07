=begin
  1.String
  2.Split it
  3.Reverse it
  4.Put it back as a string
  5.Fini
=end
require 'getoptlong'

unless ARGV.length == 2
    puts "Please call in this format: p005_9reverse.rb -s <string> -d <delimiter>"
    exit
end

# Variable declaration
str = delimiter = ''

#Parse ARGV
opts = GetoptLong.new(
    ["--string", "-s", GetoptLong::REQUIRED_ARGUMENT ],
    ["--delimiter", "-d", GetoptLong::REQUIRED_ARGUMENT ]
)

opts.each do |opt,arg|
    case opt
    when '--string'
        str = arg
    when '--delimiter'
        delimiter = arg
    end
end

puts "Original string is [#{str}]"
puts "Splitting on [#{delimiter}]"

arr = str.split(delimiter)
backwards_str = arr.reverse!.join(delimiter)
puts backwards_str 
