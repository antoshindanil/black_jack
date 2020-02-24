# frozen_string_literal: true

require_relative 'card'

class Deck
  attr_reader :current_card, :cards

  SUITS = %w[♠ ♥ ♣ ♦]

  def initialize
    @cards = []
    @pictures = %w[Валет Дама Король]
    reset_deck
  end

  def take_card
    @cards.pop
  end

  def reset_deck
    @cards.clear
    generate
    mix_deck
  end

  def mix_deck
    @cards = @cards.shuffle
  end

  private

  def generate
    SUITS.each do |suit|
      @cards.push(Card.new(1, "Туз - #{suit}"))

      (2..10).each do |value|
        @cards.push(Card.new(value, "#{value} - #{suit}"))
      end

      @pictures.each do |picture|
        @cards.push(Card.new(10, "#{picture} - #{suit}"))
      end
    end
  end
end
