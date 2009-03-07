quiz = [0,0,0,1,0,0,1,1,0,1]

no_quizes = quiz.find_all { |n| n == 0 }

puts "The number of participants who did not take Quiz 1 is:"
puts "\t#{no_quizes.length} out of #{quiz.length} total participants."