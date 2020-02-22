# frozen_string_literal: true

require_relative 'interface'
require_relative 'player'
require_relative 'deck'

class Game
  attr_reader :deck

  BLACK_JACK = 21

  ROUND_MENU = {
    1 => :dealer_turn,
    2 => :take_card,
    3 => :open_cards
  }.freeze

  def initialize
    @deck = Deck.new
    @interface = Interface.new
    # @player = Player.new(@interface.get_player_name)
    @player = Player.new('Danil')
    @dealer = Player.new('Дилер')
    start
  end

  private

  def start
    return @interface.not_enough_money if money?

    @deck = Deck.new
    @dealers_turned = false
    hand
    turn
  end

  def make_bet
    @player.make_bet
    @interface.make_bet(@player)

    @dealer.make_bet
    @interface.make_bet(@dealer)
  end

  def hand
    @deck.reset_deck
    @interface.print_bank(@player)
    @interface.print_bank(@dealer)
    make_bet
    @player.clear_cards
    @dealer.clear_cards
    card_distribution(@player)
    card_distribution(@dealer)
    @interface.print_player_points(@player)
  end

  def turn
    @interface.round_choice
    choice = gets.chomp.to_i
    send ROUND_MENU[choice] if ROUND_MENU[choice]
    open_cards
  end

  def money?
    @player.money? || @dealer.money?
  end

  def card_distribution(player)
    2.times do
      player.take_card(@deck)
      @interface.print_card(player, true)
    end
  end

  def dealer_turn
    @dealers_turned = true
    dealer_take_card if @dealer.can_take? && @player.points < 17
    open_cards if @dealer.points >= 22
  end

  def take_card
    @player.take_card(@deck) if @player.can_take?
    @interface.print_card(@player, true)
    dealer_turn
  end

  def dealer_take_card
    @dealer.take_card(@deck) if @dealer.can_take?
    @interface.print_card(@dealer, false)
    open_cards
  end

  def open_cards
    @interface.dealer_not_turn unless @dealers_turned
    return turn unless @dealers_turned

    @interface.print_player_points(@player)
    @interface.print_dealer_result(@dealer)
    calculate_result
    play_again?
  end

  def calculate_result
    case winner
    when @player
      winner_give_cash(@player, 20)
    when @dealer
      winner_give_cash(@dealer, 20)
    when 'draw'
      @interface.draw
      winner_give_cash(@dealer, 10)
      winner_give_cash(@player, 10)
    end
  end

  def winner
    return @player if @player.points > @dealer.points && @player.points <= 21
    return @dealer if @dealer.points > @player.points && @dealer.points <= 21
    return @dealer if @player.points > 21
    return @player if @dealer.points > 21
    'draw' if @dealer.points == @player.points
  end

  def winner_give_cash(player, money)
    player.increase_money(money)
    @interface.player_win(player)
  end

  def play_again?
    @interface.play_again?
    choice = gets.chomp.to_i
    case choice
    when 1
      start
    when 2
      exit
    end
  end
end
