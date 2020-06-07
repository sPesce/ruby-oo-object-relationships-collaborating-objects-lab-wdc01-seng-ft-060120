require 'pry'
class MP3Importer
    @@all = []
    attr_accessor :path

    def initialize(path)
        self.path = path
        @files = []
    end

    def files
        real_path = self.path[2...-1] + "s/*"          
       
        Dir[real_path].map{|file| file.split("/")[-1]}           
    end

    def import
        self.files.each do |file|
            Song.new_by_filename(file)
        end
    end


end