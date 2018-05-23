require_relative 'note'

class Notebook

  attr_reader :notes

  def initialize
    @notes = []
  end

  def add_note(note)
    @notes << note
  end

  def search_by_tag(tag)
    @notes.select { |note| note.tag == tag }
  end

end
