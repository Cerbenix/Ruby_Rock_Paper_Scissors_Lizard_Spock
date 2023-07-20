require_relative 'app/CLI/cli'
require_relative 'app/Models/Game/game_model'
require_relative 'app/Models/Game/game_vs_computer'
require_relative 'app/Models/Game/game_vs_multiple_computers'
require_relative 'app/Models/Game/game_vs_custom'
require_relative 'app/Models/Player/player'
require_relative 'app/Models/Player/computer'
require_relative 'app/Models/Player/user'
require_relative 'app/Controllers/game_controller'
require_relative 'app/CLI/game_mode_router'

controller = App::Controllers::GameController.new
router = App::CLI::GameModeRouter.new(controller)
router.run