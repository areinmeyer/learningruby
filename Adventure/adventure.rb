=begin
Objective: To build a console (non UI), text-based adventure game. 
Adventure games are full of objects 
� everything from the locations (�Rooms�) to the Treasures they contain. 
This project is thanks to Huw Collingbourne.

Milestone1: The first task is to decide on the main classes which will 
define the objects in the game. Most game objects 
� whether they are Rooms, Treasures, Weapons or Monsters 
� must have at least two properties: a name and a description. 
Start by creating a base class, called Thing, from which more 
specialized classes will descend. Write the relevant methods so that 
the two attributes are accessible outside of the class.

Example usage of the Thing class:
  t = Thing.new(�Satish�, �Ruby Evangelist�)

Milestone 2: Let�s move on to create some more specific descendant classes.
1. The Room class is just a Thing but it adds on some �exit� attributes. 
   These attributes will be used to indicate which room, if any, is located 
   at the North, South, West and East exits of the current room.

Example usage of the Room class:
# N S W E
@r0 = Room.new("Treasure Room", "a fabulous golden chamber", -1, 2, -1, 1)
@r1 = Room.new("Dragon's Lair", "a huge and glittering lair", -1, -1, 0, -1)
@r2 = Room.new("Troll Cave", "a dank and gloomy cave", 0, -1, -1, 3)
@r3 = Room.new("Crystal Dome", "a vast dome of glass", -1, -1, 2, -1)
# 0, 1, 2, 3 above indicate where Rooms @r0�@r3 are located

The rooms are located in these positions -
Room 0 Room 1
Room 2 Room 3

Now the code statement:
  # the numbers indicate positions N S W E
  @r0 = Room.new("Treasure Room", "a fabulous golden chamber", -1, 2, -1, 1)
indicates that to the North of Room 0, there is no Room i.e. -1 in the code. 
To the South of Room 0, there is Room 2 i.e. 2 in the code. 
To the East of Room 0 is Room 1 i.e. 1 in the code and 
to the West of Room 0 is no room i.e. -1 in the code.

2. Any adventure game needs a map (a collection of Rooms). 
   For the sake of simplicity, the Map class will simply be a class that 
   contains an array of rooms. You could, of course, use the default 
   Ruby Array class for this purpose. Or you could make the Map class a 
   descendant of Array. Let us not use the plain Array class for the simple 
   reason that you might want to add special behavior to the Map at a later date. 
   Other reasons are:
      1. We don�t want our code to have access to the whole range of Array methods 
          when we use a Map object and
      2. We may decide to change the Map class in a later revision of the code 
          (the Ruby �Hash� class � a key/value �dictionary� � could be used).

Example usage of the Map class:
# @map = Map.new(someRooms)

3. The adventure game also needs a Player (to provide the first person perspective 
    as you move through the game).We could create a special one-off class for the 
    Player. However, we�ve decided that we may need more than one object with the 
    ability to move through the game (maybe we�ll make it multi-player or maybe 
    we�ll add some �characters� who can move around through the game environment) 
    which is why we�ve create a more generic class called Actor. This class has a 
    position attribute to indicate which room it is in at any given moment.

Example usage of the Actor class:
# thePlayer = Actor.new("The Player", "You", 0)

Milestone3: Two more classes round things off:

1.  A Game class which owns the Map.

Example usage of the Game class:
@game = Game.new([@r0,@r1,@r2,@r3], @player)

2.  An Implementer class. The Implementer is, in effect, the software 
    equivalent of you � the person who programmed the game. It stands 
    above all other objects and can look down upon and manipulate the 
    entire world of the game with a godlike omniscience. Another way to think 
    of the Implementer is as a sort of chess-player moving pieces (the various 
    objects) around on a board (the map). This means that only one special 
    object, the Implementer, owns the game and needs to know where each object 
    is (i.e. in which Room) and how to move it from one Room to another.

The Implementer starts by initializing the game, then, in response to commands 
to move the player (or, in principle, any other object of the Actor class) in 
a specific direction, it looks for an exit in the current Room (given by the 
player�s position in the map � @game.map.rooms[anActor.position]) and, if it 
is a positive number, it alters the player�s position to the map index given 
by the new number, otherwise (if the number is -1) there is no exit in that 
direction and a reply is returned to say so.
  
=end

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
    @north = @south = @west = @east = -1
    @north = north 
    @south = south 
    @west = west   
    @east = east   
  end
  
  def describe
    "The #{@name} is #{@description}"
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
    puts "#{actor.name} wants to move #{direction}"
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
      "#{actor.name} is now in room #{curr_position.name}.\n#{curr_position.describe}"
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