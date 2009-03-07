=begin
  Calculate minutes in one year
=end

# Constants for time
MINUTES_IN_HOUR = 60
HOURS_IN_DAYS = 24
YEAR_IN_DAYS = 365

# the 'input'
minutes_in_days = MINUTES_IN_HOUR * HOURS_IN_DAYS
minutes_in_year = minutes_in_days * YEAR_IN_DAYS
puts format(" The number of minutes in one year is %d ", minutes_in_year)