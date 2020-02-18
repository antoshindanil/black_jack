# frozen_string_literal: true

require_relative 'card'

class Deck
  attr_reader :current_card, :cards

  def initialize
    @cards = []
    @suits = %w[♠ ♥ ♣ ♦]
    @pictures = %w[Валет Дама Король]

    generate
  end

  private

  # Генерация колоды
  def generate
    @suits.each do |suit|
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
