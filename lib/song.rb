require 'pry'
class Song
  attr_accessor :name, :artist #name= sets the song name 
  #artist= sets the artist object to belong to the song 

  @@all = []

  def initialize(song)
    @name = song
    @artist = artist
    save
  end

  def self.all #returns all existing Song instances 
    @@all
  end

  def save
    @@all << self
  end

  def self.new_by_filename(title)
    songs = title.split(" - ")[1]
    artist = title.split(" - ")[0]
    song = self.new(songs)
    song.artist_name = artist #if you don't call artist_name method, 
    song
  end

  def artist_name=(name) #setting artist name attribute
    self.artist = Artist.find_or_create_by_name(name)
    self.artist.add_song(self) 
    #self is an instance of song, self.artist returns an instance of Artist class, and then add_song is telling an instance of Artist to add a song to itself 
    binding.pry
  end
end