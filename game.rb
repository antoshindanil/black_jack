# frozen_string_literal: true

require_relative 'interface'
require_relative 'player'

class Game
  attr_reader :deck

  def initialize(deck)
    @deck = deck
    @interface = Interface.new
    @player = Player.new(@interface.get_player_name)
    @dealer = Player.new('Dealer')
    start
  end

  def start
    2.times do
      @player.take_card(@deck)
      @interface.print_card(@player)

      @dealer.take_card(@deck)
      @interface.print_card(@dealer)
    end

    @player.make_bet
    @dealer.make_bet

    @interface.print_player_points(@player)
  end
end
