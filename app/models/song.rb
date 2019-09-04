require 'byebug'

class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes


  ##BELONGS_TO METHODS
 #SETTER FOR ARTIST
  def artist_name=(artist)
    self.artist = Artist.find_or_create_by(name: artist)
  end

  #GETTER FOR ARTIST
  def artist_name
     self.artist ? self.artist.name : nil
  end

   #SETTER FOR GENRE
   def genre_name=(genre)
    self.genre = Genre.find_or_create_by(name: genre)
  end

  #GETTER FOR GENRE
  def genre_name
     self.genre ? self.genre.name : nil
  end

  ## HAS MANY NOTES
  def note_contents=(array)
    array.each do |n|
      #if n is not an empty string
      if n != ""
        note = Note.create(content: n)
        self.notes << note
      end
      self.notes
    end
  end

  def note_contents
    self.notes.map { |note| note.content }
  end

end
