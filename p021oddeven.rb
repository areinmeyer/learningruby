def is_odd?(n)
  n % 2 != 0 ? true : false
end

collection=[12,23,456,123,4579]

puts "Testing values in array . . "

collection.each do |n|
   puts "#{n} is " + (is_odd?(n) ? "odd" : "even")
end