require 'test/unit'
require_relative "lyric.rb"

class LyricTest < Test::Unit::TestCase
  LINES = [
    "the horse and the hound and the horn that belonged to",
    "the farmer sowing his corn that kept",
    "the rooster that crowed in the morn that woke",
    "the priest all shaven and shorn that married",
    "the man all tattered and torn that kissed",
    "the maiden all forlorn that milked",
    "the cow with the crumpled horn that tossed",
    "the dog that worried",
    "the cat that killed",
    "the rat that ate",
    "the malt that lay in",
    "the house that Jack built"
  ]

  def test_recite_one
    result = "This is the house that Jack built"
    assert_equal(result, Lyric.new(LINES).recite(1))
  end

  def test_recite_two
    result = "This is the malt that lay in the house that Jack built"
    assert_equal(result, Lyric.new(LINES).recite(2))
  end

  def test_recite_all
    result = "This is the horse and the hound and the horn that belonged to the farmer sowing his corn that kept the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built"
    assert_equal(result, Lyric.new(LINES).recite(12))
  end

  def test_random_recite
    assert_not_nil(Lyric.new(LINES).random_recite)
  end

  def test_recite_subject_one
    result = "This is the house"
    assert_equal(result, Lyric.new(LINES).recite_subject(1))
  end

  def test_recite_subject_two
    result = "This is the malt and the house"
    assert_equal(result, Lyric.new(LINES).recite_subject(2))
  end

  def test_recite_subject_all
    result = "This is the horse, the hound, the horn, the farmer, the rooster, the morn, the priest, the man, the maiden, the cow, the crumpled, the dog, the cat, the rat, the malt and the house"
    assert_equal(result, Lyric.new(LINES).recite_subject(12))
  end

  def test_random_recite_subject
    assert_not_nil(Lyric.new(LINES).random_recite_subject)
  end
end