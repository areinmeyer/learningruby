=begin
  
Write a method called month_days, that determines the number of days in a month. Usage:

days = month_days(5) # 31 (May)

days = month_days(2, 2000) # 29 (February 2000)

=end

require 'Date'

def month_days(month, year=Time.now.year)
  (Date.new(year, 12,31)<<12-month).day
end

puts month_days(5) # 31
puts month_days(2, 2000) # 29
puts month_days(2, 1700) # 28
puts month_days(2, 2001) # 28
puts month_days(9) # 30