# Main file for team copacetic's flashcards

require 'csv'
require_relative 'TextParser'
require_relative 'Card'
require_relative 'Deck'
require_relative 'View'

class TextParser
  #i: csv file 
  def initialize(csv_file)
    @file = csv_file
  end
  #o: set instance variable

  #i: instance variable @file
  def load
  end
  #o: array of arrays of strings

  #i: array of arrays of strings
  def arrays_to_hashes
  end
  #o: array of hashes

  def self.run
    # call load and arrays_to_hashes, return array of hashes
  end

end



class Card
  attr_reader :answer, :definition
  #i: hash from the controller with the list of strings 
  def initialize(args)
    @answer = args[:answer]
    @definition = args[:definition]
  end

  #o: a card object
end


class Deck
  attr_reader :deck
  def initialize
    @deck = []
  end

  #shifts through the cards using iteration
  def shuffle!
    @deck.shuffle!
  end

  def next_card! 
    @deck.push(@deck.shift)
  end  

  def get_top_card
    @deck[0]
  end
end



class View
  def game_intro
    puts "Welcome to the game"
    puts "rules ie 'shufffle'"
  end

  def print_definition
  end

  def get_answer
  end

  def try_again
  end

  def you_rock
  end

  def exiting
  end


end



class Controller

  def initialize(file)
    @file=file
    @game_view = View.new
    @game_deck = Deck.new
  end

  #i:
  # conversion from array of hashes to created cards
  def card_factory(unformatted_cards)
    unformatted_cards.each do |hash|
      add_cards_to_deck(Card.new(hash))
    end 
  end
  #o: card objects as an array

  #i: the output from card factory
  def add_cards_to_deck(card)
    @game_deck.deck << card
  end
  #o:  push cards into the deck class

  def run
    #possible loop
    unformatted_cards = TextParser.run(@file)
    card_factory(unformatted_cards)
    @game_view.game_intro
    @game_view.print_definition
    user_input = get_user_input
    evaluate_user_input(user_input)
  end

  def get_user_input
    @game_view.get_answer
    @answer=gets.chomp
    # returns "input" for evaluate_user_input
  end

  def evaluate_user_input(input)
    # determine whether user is guessing or giving command
    if is_input_true?
      @game_view.you_rock
    else 
      @game_view.try_again
    end
    # else execute command
  end

  def is_input_true?
    @answer.downcase == get_top_card_answer.downcase
  end  

  def get_top_card_answer
    @game_deck.get_top_card.answer
  end

  def get_top_card_definition
    @game_deck.get_top_card.definition
  end
end

filename = 'flashcard_samples.txt'
our_controller = Controller.new(filename)
our_controller.run

# talk to viewer have viewer prompt
# viewer provides a definition
# get_user_input
# evaluate_user_input
# is_input-true?

