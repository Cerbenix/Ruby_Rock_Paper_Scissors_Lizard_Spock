module App
    module CLI
      class Cli
        def self.get_game_mode
          valid_modes = ['1', '2', '3']
  
          puts "[1] Human vs Computer, 3 rounds"
          puts "  (Win more rounds against the Computer to win the game)"
          puts "[2] Human vs Three Computers, 3 rounds each"
          puts "  (Win against all Computers to win the game)"
          puts "[3] Custom Game"
          puts "  (Enter the number of rounds and number of players and have the highest score to win)"
          print "Choose game mode: "
  
          input = gets.chomp
  
          while !valid_modes.include?(input)
            print "Invalid input. Please choose a valid game mode: "
            input = gets.chomp
          end
  
          input
        end
  
        def self.get_player_name
          print "Enter your name: "
          name = gets.chomp
  
          name = "Coder" if name.empty?
  
          name
        end
  
        def self.get_player_choice
          valid_choices = ['1', '2', '3', '4', '5']
  
          loop do
            puts "Enter your choice:"
            puts "[1] Rock"
            puts "[2] Paper"
            puts "[3] Scissors"
            puts "[4] Lizard"
            puts "[5] Spock"
  
            choice = gets.chomp
  
            return choice if valid_choices.include?(choice)
  
            puts "Invalid input! Please enter a valid choice."
          end
        end
  
        def self.get_round_count
          loop do
            print "Enter number of rounds (1-5): "
            round_count = gets.chomp.to_i
  
            return round_count if (1..5).include?(round_count)
  
            puts "Invalid input! Please enter a number between 1 and 5."
          end
        end
  
        def self.get_computer_count
          loop do
            print "Enter number of computers (1-9): "
            computer_count = gets.chomp.to_i
  
            return computer_count if (1..9).include?(computer_count)
  
            puts "Invalid input! Please enter a number between 1 and 9."
          end
        end
  
        def self.print_welcome
          puts "Greetings player! Let's play Rock, Paper, Scissors, Lizard, Spock"
        end
  
        def self.print_draw
          puts "Draw!"
        end
  
        def self.print_win(player)
          puts "#{player.name} wins!"
        end
  
        def self.print_result(game_model)
          puts '============================'
          game_model.results.each { |key, value| puts "#{key}: #{value}" }
        end
  
        def self.print_round_info(player, round, round_count)
          puts '++++++++++++++++++++++++++++'
          puts "Now playing against #{player.name}. Round #{round} of #{round_count}"
        end
  
        def self.print_choices(player_one, player_two)
          puts "#{player_one.name} chose #{player_one.choice}"
          puts "#{player_two.name} chose #{player_two.choice}"
        end
      end
    end
  end