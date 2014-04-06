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

  # Make sure title and author have the requisite methods...
  def description
    "#{@title.long_name} by #{@author.first_name}"
  end

  # instead of this:
  #
  # def prose_rating
    # if pretentious_density > 0.3
      # if informal_density < 0.2
        # return :really_pretentious
      # else
        # return :somewhat_pretentious
      # end
    # elsif pretentious_density < 0.1
      # if informal_density < 0.3
        # return :really_informal
      # end
      # return :somewhat_informal
    # else
      # return :about_right
    # end    
  # end
  # 
  # or this:
  #
  # def prose_rating
    # rating = :about_right

    # if pretentious_density > 0.3
      # if informal_density < 0.2
        # rating = :really_pretentious
      # else
        # rating = :somewhat_pretentious
      # end
    # elsif pretentious_density < 0.1
      # if informal_density > 0.3
        # rating = :really_informal
      # else
        # rating = :somewhat_informal
      # end
    # end

    # rating
  # end
  # 
  # Do this:

  def prose_rating
    return :really_pretentious if really_pretentious?
    return :somewhat_pretentious if somewhat_pretentious?
    return :really_informal if really_informal?
    return :somewhat_informal if somewhat_informal?
    return :about_right
  end

  def really_pretentious?
    pretentious_density > 0.3 && informal_density < 0.2
  end

  def somewhat_pretentious?
    pretentious_density > 0.3 && informal_density >= 0.2
  end

  def really_informal?
    pretentious_density < 0.1 && informal_density > 0.3
  end

  def somewhat_informal?
    pretentious_density < 0.1 && informal_density <= 0.3
  end

  def pretentious_density
    # Somehow compute density of pretentious words
  end

  def informal_density
    # somehow compute the density of informal words
  end
end
