module App
  module Controllers
    class GameController
      include Models::Game
      include Models::Player
      include CLI

      def play_vs_computer
        user = User.new(Cli.get_player_name)
        computer = Computer.new
        game = GameVsComputer.new(user, computer)
        game.play_game
        Cli.print_result(game)
      end

      def play_vs_multiple_computers
        user = User.new(Cli.get_player_name)
        computers = []

        3.times do
          computers << Computer.new
        end

        game = GameVsMultipleComputers.new(user, computers)
        game.play_game
        Cli.print_result(game)
      end

      def play_custom_game
        user = User.new(Cli.get_player_name)
        rounds = Cli.get_round_count
        computer_count = Cli.get_computer_count
        computers = []

        computer_count.times do
          computers << Computer.new
        end

        game = GameVsCustom.new(user, computers, rounds)
        game.play_game
        Cli.print_result(game)
      end
    end
  end
end
