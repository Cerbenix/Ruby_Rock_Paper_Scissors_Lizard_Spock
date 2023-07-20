module App
    module Models
      module Player
        class User < Player
          include CLI
          def make_choice
            choices = ['Rock', 'Paper', 'Scissors', 'Lizard', 'Spock']
            choice = Cli.get_player_choice.to_i
            @choice = choices[choice - 1]
          end
        end
      end
    end
  end