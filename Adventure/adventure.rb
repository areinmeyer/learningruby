  # Constant to identify no room in that position
  NO_ROOM = -1
  
  # Constants for Room Directions array
  NORTH = 0
  SOUTH = 1
  EAST  = 2
  WEST  = 3
  
class Thing
  attr_accessor :name, :description
  def initialize(name,description)
    @name = name
    @description = description
  end
end

class Map
  def initialize(*room_array)
    @rooms = room_array
  end
  
  def room(direction)
    @rooms[direction]
  end
end

class Room < Thing
  attr_reader :rooms
  def initialize(name, description, north_rm, south_rm, east_room, west_rm)
    super(name, description)
    @rooms = Map.new(north_rm, south_rm, east_room, west_rm)
  end
end

class Actor < Thing
  attr_reader :position
  def initialize(name, description, position)
    super(name, description)
    @position = position
  end
end

r0 = Room.new("Treasure Room", "a fabulous golden chamber",  -1,  2, -1,  1)
r1 = Room.new("Dragon's Lair", "a huge and glittering lair", -1, -1,  0, -1)
r2 = Room.new("Troll Cave", "a dank and gloomy cave",         0, -1, -1,  3)
r3 = Room.new("Crystal Dome", "a vast dome of glass",        -1, -1,  2, -1)
 
puts r0.inspect
puts r1.inspect
puts r2.inspect
puts r3.inspect
 
map = Map.new( r0, r1, r2, r3 )
puts map.inspect
 
thePlayer = Actor.new("The Player", "You", 0)
puts "The player name is #{thePlayer.name}"
puts "The player description is #{thePlayer.description}"
puts "The player position is #{thePlayer.position}"