class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes


  def artist_name=(name)
    self.artist_id = Artist.find_or_create_by(name: name).id
  end

  def artist_name
    self.artist.name 

  end

  def artist=(name)
    self.artist_id = Artist.find_or_create_by(name: name).id
  end

  def song_notes=(notes)
    notes.each do |note|
      self.notes.build(content: note)
    end
  end

  def genre=(id)
    self.genre_id = id.to_i
  end

  def note_contents=(nc)
    nc.each do |n|
      notes = Note.find_or_create_by(content: n)
      self.notes << notes
    end

  end

  def note_contents
    content = []
    self.notes.each do |note|
      content << note.content
    end
    content
  end

end