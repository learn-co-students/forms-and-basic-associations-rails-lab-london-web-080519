class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def note_contents=(contents)
    contents.each do |content|
      if content != ""
        self.notes.build(content: content)
      end
    end
  end

  def note_contents
    self.notes.map do |note|
      note.content
    end
  end

  def genre_name=(name)
    genre = Genre.find_by(name: name)
    genre.songs << self
  end

  def genre_name
    self.genre.name
  end
end
