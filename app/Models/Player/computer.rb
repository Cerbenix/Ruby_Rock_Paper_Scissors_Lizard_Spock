module App
    module Models
      module Player
        class Computer < Player
          def initialize
            super(generate_name)
          end
  
          private
  
          def generate_name
            prefixes = ['Red', 'Blue', 'Green', 'Yellow', 'Purple', 'Orange']
            bases = ['Fox', 'Rabbit', 'Dog', 'Cat', 'Horse', 'Sheep']
            suffixes = ['Witch', 'Wizard', 'Warrior', 'Knight', 'Squire', 'Archer']
  
            prefix = prefixes.sample
            base = bases.sample
            suffix = suffixes.sample
  
            "#{prefix} #{base} #{suffix}"
          end
  
          public
  
          def make_choice
            choices = ['Rock', 'Paper', 'Scissors', 'Lizard', 'Spock']
            @choice = choices.sample
          end
        end
      end
    end
  end
  