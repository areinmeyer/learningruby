=begin
  Convert input (assumed to be Fahrenheit temperature) 
  to Celsius and output the result.
=end

def convert_to_celsius temp
  (temp - 32)/1.8
end

puts "Please enter a Fahrenheit temperature to convert to Celsius"
STDOUT.flush
celsius_temp = gets.chomp
fahrenheit_temp = convert_to_celsius(celsius_temp.to_f)
puts "%5.2f" % fahrenheit_temp
  