class Thing
  attr_accessor :name, :description
  def initialize(name,description)
    @name = name
    @description = description
  end
end

class Map
  def initialize(room_array)
    @rooms = room_array
  end
  
  def room(direction)
    @rooms[direction]
  end
end

class Room < Thing
  attr_accessor :north, :south, :west, :east
  def initialize(name, description, north, south, west, east)
    super(name, description)
    @north = @south = @west = @east = nil
    @north = north if north != -1
    @south = south if south != -1
    @west = west   if west  != -1
    @east = east   if east  != -1
  end
  
  def describe
    puts "The #{name} is #{description}"
  end
end

class Actor < Thing
  attr_accessor :position
  def initialize(name, description, position)
    super(name, description)
    @position = position
  end
end

class Game 
  attr_reader :map, :player
  def initialize(rooms, player)
    @map = Map.new(rooms)
    @player = player
  end
end

class Implementer
  def initialize(actor)
    r0 = Room.new("Treasure Room", "a fabulous golden chamber",  -1,  2, -1,  1)
    r1 = Room.new("Dragon's Lair", "a huge and glittering lair", -1, -1,  0, -1)
    r2 = Room.new("Troll Cave", "a dank and gloomy cave",         0, -1, -1,  3)
    r3 = Room.new("Crystal Dome", "a vast dome of glass",        -1, -1,  2, -1)
    @game = Game.new( [r0, r1, r2, r3], actor)
  end
  
  def moveActorTo( actor, direction)
    curr_position = @game.map.room(actor.position)
    new_room = case direction
      when :n
      curr_position.north
      when :s
      curr_position.south      
      when :w
      curr_position.west
      when :e
      curr_position.east
    end
    if new_room.nil?
      "There is no room in that direction (#{direction.to_s})"
    else
      actor.position = new_room
      puts "#{curr_position.describe}"
      "#{actor.name} is now in room #{curr_position.name}"
    end
  end
end

# Test it out. Create the player and the game
# Then simulate some moves around the map

thePlayer = Actor.new("The Player", "You", 0 )
imp = Implementer.new( thePlayer )

puts( imp.moveActorTo( thePlayer, :e ) )
puts( imp.moveActorTo( thePlayer, :w ) )
puts( imp.moveActorTo( thePlayer, :n ) )
puts( imp.moveActorTo( thePlayer, :s ) )
puts( imp.moveActorTo( thePlayer, :e ) )
puts( imp.moveActorTo( thePlayer, :s ) )

# === The Map ===
# @r0 -- @r1
#|
# @r2 -- @r3