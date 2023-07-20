module App
    module Models
      module Game
        class GameVsMultipleComputers < GameModel
          def initialize(user, computers)
            super()
            @user = user
            @computers = computers
          end
  
          def play_game
            rounds = 3
  
            @computers.each do |computer|
              play_match(rounds, @user, computer)
            end
  
            set_results
          end
  
          def set_results
            user_score = @user.match_score
            @results[@user.name] = user_score
  
            if user_score == 3
              @results['Result'] = "#{@user.name} Wins"
            end
  
            @computers.each do |computer|
              @results[computer.name] = computer.match_score
            end
  
            @results['Result'] ||= 'No Winner'
          end
        end
      end
    end
  end
  