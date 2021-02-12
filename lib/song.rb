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
    self.all << song
    song
  end

  def self.new_by_name(name)
    person = self.new
    person.name = name
    person
  end

  def self.create_by_name(name)
    person = self.new
    person.name = name
    self.all << person
    person

  end

  def self.find_by_name(name)
    self.all.find {|songs| songs.name == name}
  end

  def self.find_or_create_by_name(name)
    is_present = self.find_by_name(name)
    if is_present == nil
      self.create_by_name(name)
    else
      is_present
    end
  end

  def self.alphabetical
    self.all.sort_by{|objs| objs.name}
  end

  def self.new_from_filename(filename)
    person = self.new

    both_names = filename.split(' - ')
    artist_name = both_names[0]
    artist_song = both_names[1]
    no_mp3 = artist_song.split(".").shift

    person.name = no_mp3
    person.artist_name = artist_name
    person
  end

  def self.create_from_filename(filename)
    person = self.new

    both_names = filename.split(' - ')
    artist_name = both_names[0]
    artist_song = both_names[1]
    no_mp3 = artist_song.split(".").shift

    person.name = no_mp3
    person.artist_name = artist_name
    self.all << person
    person
  end

  def self.destroy_all
    @@all = []
  end

end
