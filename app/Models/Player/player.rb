module App
    module Models
      module Player
        class Player
          attr_reader :name, :round_score, :match_score, :choice
  
          def initialize(name)
            @name = name
            @round_score = 0
            @match_score = 0
            @choice = ""
          end
  
          def reset_round_score
            @round_score = 0
          end
  
          def add_round_score
            @round_score += 1
          end
  
          def add_match_score
            @match_score += 1
          end
  
          def make_choice
            raise NotImplementedError, "You must implement the 'make_choice' method in your subclass."
          end
        end
      end
    end
  end