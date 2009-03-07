def grandma_responds(conversation)
  respone = ''
  if conversation.upcase!
    response = "NO, NOT SINCE " + random_year() + "!"
  else
    response = "HUH?!  SPEAK UP, SONNY!"
  end
  
  return response
end

def random_year
  years = (1930..1951).to_a
  years[rand(years.size)].to_s
end

myinput = ''
until (myinput == "BYE")
  puts "Your Turn:"
  STDOUT.flush
  myinput = gets.chomp
  puts grandma_responds(myinput)
end
