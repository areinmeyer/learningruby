=begin
  Write a method last_modified(file) that takes a file name 
and displays something like this: 
  file was last modified 125.873605469919 days ago. 

=end

require 'Time'
SECONDS_IN_DAY=24*60*60

def last_modified(file)
  mod_time = (Time.now - File.mtime(file))/SECONDS_IN_DAY
  puts "#{file} was last modified %.3f days ago\n" % mod_time
end

last_modified("testgameboard.rb")
last_modified("show_days.rb")