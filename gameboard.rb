class GameBoard
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
    @already_hit = Array.new
  end
  
  def check_yourself(guess)
    result = ''
    
    # Too much Contra as a kid...
    if guess.match(/uuddlrlrababss/)
      puts show_marked_blocks()
    elsif guess.match(/help/)
      puts @help      
    elsif guess.match(/\d/) && @marked_blocks.include?(guess.to_i) && !(@already_hit.include?(guess))
      increment_hits
      @already_hit << guess
      result = @no_of_hits == 3 ? 'kill' : 'Hit'
    else
      result = 'Miss'      
    end
    puts result
    return result
  end
  
  def show_marked_blocks
    @marked_blocks.join('-')
  end
  
  def status
    puts "#{@no_of_hits} out of 3 in #{@no_of_guesses} turn(s)"
  end
  
  def set_locations_cells(blocks)
    @marked_blocks = blocks
  end
  
  private
  
  def increment_hits
    @no_of_hits += 1
  end
end
