# frozen_string_literal: true

class Player
  attr_reader :name, :cards, :bank, :points

  BLACK_JACK = 21
  MAX_CARDS = 3

  def initialize(name)
    @name = name
    @bank = 100
    @cards = []
    @points = 0
  end

  def take_card(deck)
    card = deck.take_card

    ace_calculate if card.value == 1
    @points += card.value
    @cards << card
  end

  def can_take?
    @cards.length < MAX_CARDS
  end

  def make_bet
    @bank -= 10
  end

  def money?
    true unless @bank >= 10
  end

  def increase_money(money)
    @bank += money
  end

  def clear_cards
    @cards.clear
    @points = 0
  end

  private

  def ace_calculate
    @points += if @points + 11 <= BLACK_JACK
                 11
               else
                 1
               end
  end
end
