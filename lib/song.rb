class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

def self.create
  song = self.new
  @@all << song
  song
end

def self.new_by_name(name)
  song = self.new
  song.name = name
  song
end

def self.create_by_name(song_name)
  song = self.create
  song.name = song_name
  song
end

def self.find_by_name(song_name)
    self.all.detect {|song| song.name == song_name}
end

def self.find_or_create_by_name(song_name)
  if self.find_by_name(song_name) == nil
    self.create_by_name(song_name)
  else
    self.all.detect {|song| song.name == song_name}
  end
end

def self.alphabetical
  self.all.sort_by{|song| song.name}
end

def self.new_from_filename(mp3)
  mp3.split(/\ - |\./)
  artist = mp3[0]
  song_name = mp3[1]
end
