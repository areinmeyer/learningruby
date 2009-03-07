=begin
  Calculate a age provided in seconds to 
  Gregorian calendar years.  Use 365.25 days
  as the standard for one year.  
=end

# Constants for time
SECONDS_IN_MIN = 60
MINUTES_IN_HOUR = 60
HOURS_IN_DAYS = 24
YEAR_IN_DAYS = 365.25

# the 'input'
seconds_old = 979000000
seconds_in_one_year = SECONDS_IN_MIN * MINUTES_IN_HOUR * HOURS_IN_DAYS * YEAR_IN_DAYS
age = seconds_old/seconds_in_one_year

puts format("%d seconds is ", seconds_old)
puts format("\t%.2f years" % age)