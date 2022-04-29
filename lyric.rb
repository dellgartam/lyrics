class Lyric

  def initialize(lines = [])
    @lines = lines
  end

  def subject
    # extract all word after the word "the" for each lines to get the subjects
    # output should be an array like ["the house", "the horse", ...]
    @lines.map{|line| line.scan(/\bthe \w+/).join(", ")}
  end

  def recite(line_number)
    # Grab the last `line_number` element, iterate it, add it to result
    return "" if line_number == 0
    result = "This is"
    lines.last(line_number).each do |line|
      result += " #{line}"
    end
    result
  end

  def random_recite
    recite(random_line_number)
  end

  def recite_subject(line_number)
    # If line_number = 0 then return empty string
    return "" if line_number == 0
    
    # If line_number = 1 then return only the last subject
    return "This is " + subject.last if line_number == 1
    
    # If line_number > 1 then join all element separated by comma except the last element.
    # Join the last element using "and"
    "This is " + subject.last(line_number)[0..-2].join(", ") + " and " + subject.last
  end

  def random_recite_subject
    recite_subject(random_line_number)
  end

  private
  def random_line_number
    rand(@lines.length)
  end
end