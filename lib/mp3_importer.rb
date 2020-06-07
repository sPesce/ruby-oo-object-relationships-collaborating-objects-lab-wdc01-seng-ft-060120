require 'pry'
class MP3Importer
    @@all = []
    attr_accessor :path

    def initialize(path)
        self.path = path
        @files = []
    end
    #path is wrong, fixed with 'real_path'
    def files
        real_path = self.path[2...-1] + "s/*"#trim './' and add 's/*'          
       
        Dir[real_path].map{|file| file.split("/")[-1]}           
    end

    #create songs and artists from files
    def import
        self.files.each do |file|
            Song.new_by_filename(file)
        end
    end


end