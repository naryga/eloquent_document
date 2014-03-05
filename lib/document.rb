class Document
  VERSION = "1.0.0"

  attr_accessor :read_only
  attr_reader :title, :author, :content

  def initialize(title, author, content)
    @title = title
    @author = author
    @content = content
  end

  def words
    @content.split
  end

  def word_count
    words.size
  end

  def title=(new_title)
    @title = new_title unless @read_only
  end

  def author=(new_author)
    @author = new_author unless @read_only
  end

  def content=(new_content)
    @content = new_content unless @read_only
  end

  def print_fonts
    fonts = [ 'courier', 'times roman', 'helvetica' ]

    fonts.each do |font|
      puts font
    end
  end

  def add_author(*names)
    @author += "{ names.join(' ') }"
  end

  # Instead of this:
  # def index_for( word )
    # i = 0 
    # words.each do |this_word|
      # return i if word == this_word
      # i += 1
    # end
    # nil
  # end
  # do this:
  
  def index_for( word )
    words = %w { Mary had a little lamb }
    words.find_index { |this_word| word == this_word }
  end

  # instead of this
  # def average_word_length
    # total = 0.0
    # words.each { |word| total += word.size }

    # total / word_count
  # end
  # do this:
  def average_word_length
    total = words.inject(0.0) { |result, word| word.size + result }
    total / word_count
  end

  def obscure_times!
    @content.gsub( /\d\d:\d\d (AM|PM)/, '**:** **' )
  end

end
