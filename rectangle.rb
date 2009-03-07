class Rectangle
  
  def initialize(length, width)
    @length = length
    @width = width
  end
  
  def area
    return @length * @width
  end
  
  def perimeter
    return (2*@length) + (2*@width)
  end
end