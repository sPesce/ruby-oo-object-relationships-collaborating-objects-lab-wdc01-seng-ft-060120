class Artist
    
    @@all = []
    attr_accessor :name

    def initialize(name)
        @name = name
        self.class.all << self
    end

    def self.all
        @@all
    end

    def songs
        Song.all.select{|song| song.artist == self}
    end

    def add_song(song)
        song.artist = self
    end
    #return artist that has name: artist_name, but create it first
    #if !exist
    def self.find_or_create_by_name(artist_name)
        artist = self.all.find{|artist_inst| artist_inst.name == artist_name}
        if artist == nil
            Artist.new(artist_name)            
        else
            return artist 
        end
    end

    def print_songs
        self.songs.each{|song| puts song.name}
    end

end