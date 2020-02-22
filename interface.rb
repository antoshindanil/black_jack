# frozen_string_literal: true

class Interface
  def get_player_name
    puts 'Добро пожаловать в Блэк Джэк'
    print 'Введите ваше имя: '
    gets.chomp
  end

  def print_card(player, show_card)
    if show_card == true
      puts "#{player.name} получает #{player.cards.last}"
    else
      puts "#{player.name} получает * - *"
    end
  end

  def print_player_points(player)
    points = player.points
    puts "У вас #{points} очков"
  end

  def print_bank(player)
    puts "Банк игрока #{player.name}: #{player.bank}$"
  end

  def round_choice
    puts 'Выберите действие:'
    puts '1 - Пропустить (Передать ход дилеру)'
    puts '2 - Взять одну карту.'
    puts '3 - Открыть карты.'
  end

  def not_enough_money
    puts 'К сожалению, вас карман пуст.'
  end

  def make_bet(player)
    puts "#{player.name} сделал ставку!"
  end

  def player_take_card(_player)
    puts 'Вы взяли дополнительную карту!'
  end

  def dealer_take_card(_player)
    puts 'Дилер взял дополнительную карту!'
  end

  def dealer_not_turn
    puts 'Дилер еще не ходил! Передайте ход.'
  end

  def print_dealer_result(player)
    puts "Очки дилера: #{player.points}"
  end

  def player_win(player)
    puts "#{player.name} выиграл!"
  end

  def draw
    puts 'Это ничья!'
  end

  def play_again?
    puts 'Игра окончена! Продолжить?'
    puts '1 - Да'
    puts '2 - Нет'
  end
end
