
module ExampleBrains
  ## This is a sample brain to show basic brain structure and interaction with the player.
  class PlaysAllPossibleCardsBrain < Brain
    # Pick some number of emoji to represent your brain.
    # by convention, all brain emoji end with `:neckbeard:`.
    # The list of supported emojis can be found
    # here: http://www.emoji-cheat-sheet.com/
    def self.emoji
      ':eight_spoked_asterisk::flower_playing_cards::neckbeard:'
    end

    # you have the option of picking from many cards, pick the best one.
    def pick(number, *cards)
      cards.flatten.first(number)
    end

    #After instantiation the Game will pass the brain two characters from the characters in the models/characters folder, the choose_character method must return one of the two characters.
    def choose_character(character_1, character_2)
      character_1
    end

    #This method is called on your brain when you are the target of a card that has a bang action (a missable attack). Your brain is given the card that attacked them.  The method should return a card from your hand
    def target_of_bang(card, targetter, missed_needed)
      if player.hand.count{ |x| x.type == Card.missed_card } >= missed_needed
        player.hand.select{|x| x.type == Card.missed_card}.first(missed_needed)
      else
        []
      end
    end
    def target_of_indians(card, targetter)
      player.from_hand(Card.bang_card)
    end
    def target_of_duel(card, targetter)
      player.from_hand(Card.bang_card)
    end
    #This method is called if your hand is over the hand limit, it returns the card that you would like to discard.
    # Returning nil or a card you don't have is a very bad idea. Bad things will happen to you.
    def discard
      player.hand.first
    end

    # Pick where to draw from
    def draw_choice(choices)
      choices.last
    end

    #This is the method that is called on your turn.
    def play
      player.hand.each do |card|
        next if !card
        next if card.type == Card.missed_card || !player.players_in_range_of(card).first
        if card.type == Card.jail_card && player.players_in_range_of(card).first.sheriff?
          next if !player.players_in_range_of(card)[1]
          player.play_card(card, player.players_in_range_of(card)[1], :hand)
        else
          player.play_card(card, player.players_in_range_of(card).first, :hand)
        end
      end
    end
  end
end
