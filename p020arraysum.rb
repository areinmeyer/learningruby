=begin
  p020arraysum.rb -s'1,2,3,4,5,6' -d','
=end

require 'getoptlong'

unless ARGV.length == 2
    puts "Please call in this format: p020arraysum.rb -s<string> -d<delimiter>"
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

numbers = str.split(delimiter)

puts "Adding values in array..."
total = 0
numbers.each do |n|
  puts "#{total} + #{n}"
  total += n.to_i
end

puts total