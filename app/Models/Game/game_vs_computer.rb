module App
    module Models
      module Game
        class GameVsComputer < GameModel
          def initialize(user, computer)
            super()
            @user = user
            @computer = computer
          end
  
          def play_game
            rounds = 3
            play_match(rounds, @user, @computer)
            set_results
          end
  
          def set_results
            user_score = @user.round_score
            computer_score = @computer.round_score
  
            @results[@user.name] = user_score
            @results[@computer.name] = computer_score
  
            if user_score == computer_score
              @results['Result'] = 'Draw'
            elsif user_score > computer_score
              @results['Result'] = "#{@user.name} Wins"
            else
              @results['Result'] = "#{@computer.name} Wins"
            end
          end
        end
      end
    end
  end