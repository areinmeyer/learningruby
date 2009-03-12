class Gameboard
  attr_reader :no_of_hits, :no_of_turns, :help
  
  
  def initialize
    @help = <<END_HELP
    I have marked 3 of 7 blocks.
    Try to guess which ones in the least amount 
    of time.  
    
    GRADES:
    3 Guesses = GENIUS
    4 Guesses = SMART
    5 Guesses = NOT BAD
    6 Guesses = MEH
    7+ Guesses = Just stop, OK?  
END_HELP
    @no_of_hits = 0
    @no_of_guesses = 0
    mark_blocks()
  end
  
  def analyze_guess(guess)
    result = ''
    if guess.match(/ududlrlrababss/)
      result = show_marked_blocks
    elsif guess.match(/help/)
      result = @help      
    elsif guess.match(/\d/) && @marked_blocks.include?(guess.to_i)
      increment_hits
      increment_turn
      result = @no_of_hits == 3 ? 'End' : 'Hit'
    else
      increment_turn
      result = 'Miss'      
    end
    
    puts result
  end
  
  def show_marked_blocks
    @marked_blocks.join('-')
  end
  
  def status
    puts "#{@no_of_hits} out of 3 in #{@no_of_guesses} turn(s)"
  end
  
  private
  
  def increment_turn
    @no_of_guesses += 1
  end
  
  def increment_hits
    @no_of_hits += 1
  end
  
  def mark_blocks
    start_block = rand(6)
    @marked_blocks = [start_block, start_block+1, start_block+2 ]
  end
end

puts "Let the game begin!!"
puts "-" * 15
puts "|0|1|2|3|4|5|6|"
puts "-" * 15
puts "Guess which 3 consecutive blocks I have marked!"
game = GuessGame.new

while (game.no_of_hits < 3)
  puts "\n\nGuess which blocks are marked:"
  STDOUT.flush
  guess = gets.chomp
  game.analyze_guess guess
  
end

game.status