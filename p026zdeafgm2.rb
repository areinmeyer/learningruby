def grandma_responds(conversation)
  respone = ''
  if conversation == conversation.upcase
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
goodbye_count = 0

while true
  puts "Your Turn:"
  STDOUT.flush
  myinput = gets.chomp
  goodbye_count += 1 if myinput == "BYE"
  exit if goodbye_count == 3
  puts grandma_responds(myinput)
end
