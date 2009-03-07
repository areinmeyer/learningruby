str = 'key=value'
str.scan(/(^.*)=(.*$)/) do |s1,s2| 
    puts s1
    puts s2
end
