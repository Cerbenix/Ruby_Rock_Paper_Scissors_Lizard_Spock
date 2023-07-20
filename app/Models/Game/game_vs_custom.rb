module App
    module Models
      module Game
        class GameVsCustom < GameModel
          def initialize(user, computers, rounds)
            super()
            @user = user
            @computers = computers
            @rounds = rounds
          end
  
          def play_game
            players = [@user] + @computers
  
            (0...players.length - 1).each do |i|
              player_one = players[i]
  
              (i + 1...players.length).each do |j|
                player_two = players[j]
                play_match(@rounds, player_one, player_two)
              end
            end
  
            set_results
          end
  
          def set_results
            player_scores = {}
            player_scores[@user.name] = @user.match_score
  
            @computers.each do |computer|
              player_scores[computer.name] = computer.match_score
            end
  
            top_score = player_scores.values.max
            winners = player_scores.select { |_name, score| score == top_score }.keys
  
            winners.each do |winner|
              @results[winner] = player_scores[winner]
            end

            player_scores.each do |name, score|
              @results[name] = score
            end
  
            @results['Result'] = winners.length == 1 ? "#{winners[0]} Wins" : 'Draw'
          end
        end
      end
    end
  end
  