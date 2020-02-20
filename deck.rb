# frozen_string_literal: true

require_relative 'card'

class Deck
  attr_reader :current_card, :cards

  def initialize
    @cards = []
    @suits = %w[♠ ♥ ♣ ♦]
    @pictures = %w[Валет Дама Король]
    generate
    mix_deck
  end

  # Возвращает результат удаления карты с конца массива
  def take_card
    @cards.pop
  end

  # Сбрасывает колоду
  def reset_deck
    @cards = []
    generate
    mix_deck
  end

  private

  # Мешает массив с картами
  def mix_deck
    @cards = @cards.shuffle
  end

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
