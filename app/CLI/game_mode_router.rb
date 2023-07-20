module App
  module CLI
    class GameModeRouter
      def initialize(controller)
        @controller = controller
      end

      def run
        Cli.print_welcome
        game_mode = Cli.get_game_mode

        case game_mode
        when '1'
          @controller.play_vs_computer
        when '2'
          @controller.play_vs_multiple_computers
        when '3'
          @controller.play_custom_game
        end
      end
    end
  end
end
