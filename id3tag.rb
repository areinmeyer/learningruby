=begin
  Write a Ruby program that analyzes an MP3 file. 
  Many MP3 files have a 128-byte data structure at the end called an ID3 tag. 
  These 128 bytes are literally packed with information about the song: 
    its name, the artist, which album it's from, and so on. 
  You can parse this data structure by opening an MP3 file and doing a 
  series of reads from a position near the end of the file. According to the ID3 
  standard, if you start from the 128th-to-last byte of an MP3 file and read 
  three bytes, you should get the string TAG. If you don't, there's no ID3 tag 
  for this MP3 file, and nothing to do. If there is an ID3 tag present, then the 
  30 bytes after TAG contain the name of the song, the 30 bytes after that contain 
  the name of the artist, and so on. 
=end
class MP3Tags
  
  GENRES = [:Blues, :'Classic Rock', :Country, :Dance, :Disco, :Funk, :Grunge, :'Hip-Hop', :Jazz,
    :Metal, :'New Age', :Oldies, :Other, :Pop, :'R&B', :Rap, :Reggae, :Rock, :Techno, :Industrial,
    :Alternative, :Ska, :'Death Metal', :Pranks, :Soundtrack, :'Euro-Techno', :Ambient, :'Trip-Hop',
    :Vocal, :'Jazz+Funk', :Fusion, :Trance, :Classical, :Instrumental, :Acid, :House, :Game,
    :'Sound Clip', :Gospel, :Noise, :AlternRock, :Bass, :Soul, :Punk, :Space, :Meditative,
    :'Instrumental Pop', :'Instrumental Rock', :Ethnic, :Gothic, :Darkwave, :'Techno-Industrial',
    :Electronic, :'Pop-Folk', :Eurodance, :Dream, :'Southern Rock', :Comedy, :Cult, :Gangsta,
    :'Top 40', :'Christian Rap', :'Pop/Funk', :Jungle, :'Native American', :Cabaret, :'New Wave',
    :Psychadelic, :Rave, :Showtunes, :Trailer,:'Lo-Fi', :Tribal, :'Acid Punk', :'Acid Jazz', :Polka,
    :Retro, :Musical, :'Rock & Roll', :'Hard Rock' ]

  attr_reader :title, :artist, :album, :year, :comments, :genre, :track
  
  def initialize(song)
    @song = File.new(song)
    tag, @title, @artist, @album, @year, @comments, genre_id =
      @song.read[-128..-1].unpack("A3A30A30A30A4A30C")
    raise StandardException, "No Tags found for track" unless tag == 'TAG'
    @genre = GENRES[genre_id].to_s
    if @comments.length == 30 && @comments[28] == 0 
      @track = @comments[29].to_s
      @comments = @comments[0..27]
    else
      @track = 'n/a'
    end
  end
end

test = '/cygdrive/C/Documents and Settings/areinmeyer/My Documents/My Music/iTunes/iTunes Music/Massive Attack/Mezzanine/01 Angel.mp3'
mysong = MP3Tags.new(test)
puts mysong.title
puts mysong.artist
puts mysong.album
puts mysong.year
puts mysong.comments
puts mysong.track

