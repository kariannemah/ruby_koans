# EXTRA CREDIT:
#
# Create a program that will play the Greed Game.
# Rules for the game are in GREED_RULES.TXT.
#
# You already have a DiceSet class and score function you can use.
# Write a player class and a Game class to complete the project.  This
# is a free form assignment, so approach it however you desire.

# keep classes under 100 lines
# five lines per method
  # private methods need very clear names


class DiceSet

  attr_accessor :values

  def initialize(*)
    super
    self.values = []
  end

  def roll(n)
    self.values = []
    n.times do
    self.values << rand(6) + 1
   end
  end
end

class Player

end



class Game


  def triplet
    if [dice[-1], dice[-2], dice[-3]].uniq.length == 1
      triplet = dice.pop(3)
    end
  end

  def score(dice)

    frequency_of_number = dice.inject(Hash.new(0)) { |h,v| h[v] += 1; h}
    dice = dice.sort_by { |v| frequency_of_number[v] }



    points_from_ones = dice.count(1) * 100
    points_from_fives = dice.count(5) * 50
    points_from_ones_and_fives = points_from_ones + points_from_fives

    if triplet.nil? == true
      points_from_ones_and_fives
    elsif triplet == [1,1,1]
      1000 + points_from_ones_and_fives
    elsif triplet != []
      triplet[0] * 100 + points_from_ones_and_fives
    else dice == []
      0
    end
  end
end