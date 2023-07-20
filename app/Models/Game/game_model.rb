module App
    module Models
      module Game
        class GameModel
          include CLI
          attr_reader :results
          def initialize
            @rules = {
              'Rock' => ['Scissors', 'Lizard'],
              'Paper' => ['Rock', 'Spock'],
              'Scissors' => ['Paper', 'Lizard'],
              'Lizard' => ['Paper', 'Spock'],
              'Spock' => ['Rock', 'Scissors']
            }
            @results = {}
          end
  
          def play_user_round(user, computer)
            user.make_choice
            computer.make_choice
  
            Cli.print_choices(user, computer)
  
            player_choice = user.choice
            computer_choice = computer.choice
  
            if player_choice == computer_choice
              Cli.print_draw
            elsif @rules[player_choice].include?(computer_choice)
              Cli.print_win(user)
              user.add_round_score
            else
              Cli.print_win(computer)
              computer.add_round_score
            end
          end
  
          def play_computer_round(computer_one, computer_two)
            computer_one.make_choice
            computer_two.make_choice
  
            computer_one_choice = computer_one.choice
            computer_two_choice = computer_two.choice
  
            if @rules[computer_one_choice].include?(computer_two_choice)
              computer_one.add_round_score
            elsif @rules[computer_two_choice].include?(computer_one_choice)
              computer_two.add_round_score
            end
          end
  
          def play_match(rounds, player_one, player_two)
            player_one.reset_round_score
            player_two.reset_round_score
          
            1.upto(rounds) do |round_count|
              if player_one.is_a?(App::Models::Player::User)
                Cli.print_round_info(player_two, round_count, rounds)
                play_user_round(player_one, player_two)
              else
                play_computer_round(player_one, player_two)
              end
          
              break if player_one.round_score > rounds / 2 || player_two.round_score > rounds / 2
            end
          
            if player_one.round_score > player_two.round_score
              player_one.add_match_score
            elsif player_two.round_score > player_one.round_score
              player_two.add_match_score
            end
          end
  
          def play_game
            raise NotImplementedError, "You must implement the 'play_game' method in your subclass."
          end
  
          def set_results
            raise NotImplementedError, "You must implement the 'set_results' method in your subclass."
          end
        end
      end
    end
  end