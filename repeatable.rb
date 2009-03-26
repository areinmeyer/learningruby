=begin
  Let's say you want to run some Ruby code 
  (such as a call to a shell command) repeatedly at a certain interval 
  (for example, once every five seconds for one minute). 
  Write a method for this. 
  Do not use Thread class for now. 

  Hint: yield and sleep methods may be required.
=end
require 'Time'

def repeat_command(interval=5, limit=60)
  elapsed = 0
  loop do  
    yield
    elapsed = elapsed + interval
    break if elapsed >= limit
    sleep(interval) 
  end
  
end

repeat_command(10,30) {system "date"}