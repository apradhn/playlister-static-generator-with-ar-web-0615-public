class SiteGenerator
  attr_accessor :path, :artists, :genres, :songs

  def initialize(path)
    require 'fileutils'
    @path = path
    FileUtils.mkdir_p path
    @artists = Artist.all
    @genres = Genre.all
    @songs = Song.all    
  end

  def rendered_path
    self.path
  end

  def build_index
    html = File.read("./app/views/index.html.erb")
    template = ERB.new(html)
    result = template.result(binding)
    File.write("#{self.path}/index.html", result)
  end

  def build_artists_index
    FileUtils.mkdir_p("#{self.path}/artists")
    html = File.read("./app/views/artists/index.html.erb")
    template = ERB.new(html)
    result = template.result(binding)
    File.write("#{self.path}/artists/index.html", result)
  end

  def build_artist_page
    html = File.read("./app/views/artists/show.html.erb")
    self.artists.each do |artist|
      @artist = artist
      template = ERB.new(html)
      result = template.result(binding)      
      File.write("#{self.path}/artists/#{artist.to_slug}.html", result)
    end
  end

  def build_genres_index
    FileUtils.mkdir_p("#{self.path}/genres")
    html = File.read("./app/views/genres/index.html.erb")
    template = ERB.new(html)
    result = template.result(binding)
    File.write("#{self.path}/genres/index.html", result)    
  end

  def build_genre_page
    html = File.read("./app/views/genres/show.html.erb")
    self.genres.each do |genre|
      @genre = genre
      template = ERB.new(html)
      result = template.result(binding)      
      File.write("#{self.path}/genres/#{genre.to_slug}.html", result)
    end    
  end

  def build_songs_index
    FileUtils.mkdir_p("#{self.path}/songs")
    html = File.read("./app/views/songs/index.html.erb")
    template = ERB.new(html)
    result = template.result(binding)
    File.write("#{self.path}/songs/index.html", result)      
  end

  def build_song_page
    html = File.read("./app/views/songs/show.html.erb")
    self.songs.each do |song|
      @song = song
      template = ERB.new(html)
      result = template.result(binding)      
      File.write("#{self.path}/songs/#{song.to_slug}.html", result)
    end        
  end
  
end