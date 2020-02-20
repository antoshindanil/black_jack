# frozen_string_literal: true

class Interface
  def get_player_name
    puts 'Добро пожаловать в Блэк Джэк'
    print 'Введите ваше имя: '
    gets.chomp
  end

  def print_card(player)
    if player.name == 'Dealer'
      puts 'Дилер получает * - *'
    else
      puts "#{player.name} получает #{player.cards.last}"
    end
  end

  def print_player_points(player)
    points = player.points
    puts "У вас #{points} очков"
  end
end
