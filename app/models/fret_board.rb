class FretBoard
  Sharp      = "&#9839;"
  Flat       = "&#9837;"
  OpenNotes  = %w{E B G D A E}
  NoteStream = ["A","A#{Sharp} B#{Flat}","B","C",
                "C#{Sharp} D#{Flat}","D","D#{Sharp} E#{Flat}",
                "E","F","F#{Sharp} G#{Flat}","G","G#{Sharp} A#{Flat}"]
  FullStream = NoteStream * 3

  attr_accessor :strings

  def initialize(frets=12)
    @strings = OpenNotes.map{ |n| String.new(n, frets) }
    # apply_pentatonic_scale!
  end

  def apply_pentatonic_scale!
    clear!
    PentatonicScale.new(self)
  end

  def clear!
    strings.each do |s|
      s.notes.each do |n|
        n.marked = false
      end
    end
  end


  class String
    attr_accessor :notes, :marked

    def initialize(open_note, frets=12)
      @marked = false
      index   = FretBoard::NoteStream.index(open_note)
      @notes  = (0..frets).map do |fret|
        note = FretBoard::FullStream[index + fret]
        Note.new(note)
      end
    end
  end


  class Note
    attr_accessor :note, :marked

    def initialize(note, marked=false)
      @note   = note
      @marked = marked
    end

    def whole?
      note.length == 1
    end

    def pentatonic?
      OpenNotes.include?(note)
    end
  end

end
