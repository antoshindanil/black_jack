# frozen_string_literal: true

require_relative 'card'

class Deck
  attr_reader :current_card, :cards

  def initialize
    @cards = []
    @suits = %w[♠ ♥ ♣ ♦]
    generate
  end

  private

  # Генерация колоды
  def generate
    @suits.each do |suit|
      generate_suit(suit)
    end
  end


  # Генерация масти, не хотел делать внутренний цикл
  def generate_suit(suit)
    (1..13).each do |value|
      @cards.push(Card.new(value, "#{generate_name(value)} - #{suit}"))
    end
  end

  def generate_name(value)
    case value
    when 1
      'Туз'
    when 11
      'Валет'
    when 12
      'Дама'
    when 13
      'Король'
    else
      value
    end
  end
end
