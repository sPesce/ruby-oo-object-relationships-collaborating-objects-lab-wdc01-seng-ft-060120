require 'pry'
class Song

    
    attr_accessor :name, :artist

    @@all = []
    
    def initialize(name)        
        self.name = name
        self.class.all << self
    end

    def self.all
        @@all
    end

    def self.new_by_filename(filename)
        artist_name  =   filename.split(" - ")[0]
        song_name    =   filename.split(" - ")[1].split(".")[0]
        my_song = Song.new(song_name)
        
        artist = Artist.find_or_create_by_name(artist_name)
        artist.add_song(my_song)
        return my_song
    end

    def artist_name=(artist_name)
        self.artist = Artist.find_or_create_by_name(artist_name)
    end
    
end