class UnpredictableString < String
  def scramble
      @string = @string.split(//).sort_by { rand }.join('')
  end

  def initialize(string)
    @string = string
    super(scramble)
    
  end
  
  def to_str
    @string = scramble
  end
  
  def to_s
    @string = scramble
  end
end

str = UnpredictableString.new(ARGV[0])
puts str
puts str.to_str
puts str.scramble