# frozen_string_literal: true

class Player
  attr_reader :name, :cards, :bank

  WIN_POINTS = 21
  MAX_CARDS = 3

  def initialize(name)
    @name = name
    @bank = 100
    @cards = []
    @points = 0
  end

  def take_card(deck)
    @cards << deck.take_card
  end

  def points
    @cards.each do |card|
      if card.value == 1
        ace_calculate
      end
      @points += card.value
    end
    @points
  endD

  def make_bet
    @bank -= 10
  end

  private

  def ace_calculate
    if @points + 11 <= WIN_POINTS
      @points += 11
    else
      @points += 1
    end
  end
end
