# Main file for team copacetic's flashcards

require 'csv'
require_relative 'CSVModel'
require_relative 'Card'
require_relative 'Deck'
require_relative 'View'

class CSVModel
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

  def run
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
    @game_view = View.new
    @game_deck = Deck.new
    @game_csv = CSVModel.new(file)
  end

  #i:
  # conversion from array of hashes to created cards
  def card_factory(array_of_hashes)
    
  end
  #o: card objects as an array

  #i: the output from card factory
  def add_cards_to_deck
    
  end
  #o:  push cards into the deck class

  def run
    # calls @game_csv.run
    # other stuff too; drives whole program
  end

  def get_user_input
    # calls @game_view.get_answer
    # uses gets.chomp to get input
    # returns "input" for evaluate_user_input
  end

  def evaluate_user_input(input)
    # determine whether user is guessing or giving command
    # if guess call is_input_true? on downcase
    # else execute command
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
