require 'pry'

class Song
  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    @artist = artist
    @genre = genre
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_by_name(name)
    self.all.detect{|s| s.name == name}
    self.artist = artist if artist != nil
    self.genre = genre if genre != nil
  end

  def self.all 
    @@all.uniq
  end

  def self.destroy_all 
    @@all.clear
  end

  def self.destroy_all
    @@all.clear
  end
  
  def artist=(artist)
  end
  
  def genre=(genre)
    @genre = genre
    @genre = genre 
    genre.songs << self unless genre.songs.include?(self)
  end

  def save
    @@all << self
  end
  
  def self.create(name)
    self.new(name).tap do|song|
      song.save
    end
  end
    
  def self.new_from_filename(song)
    song_parts = song.split(" - ")
    song_name = song_parts[1]
    artist = Artist.find_or_create_by_name(song_parts[0])
    genre = Genre.find_or_create_by_name(song_parts[2].split('.')[0])
    self.create(song_name, artist, genre)  
  end

  def to_s
    "#{self.artist.name} - #{self.name} - #{self.genre.name}"
  end
  
  def self.create_from_filename(song)
    self.new_from_filename(song)
  end  
end