class Game
  def play
    puts "Welcome to MASTERMIND. Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
    mastermind = Mastermind.new
    response = nil
    until response == "Thanks for playing!"
      print "> "
      input = gets.chomp.downcase
      response = mastermind.run(input)
      puts response
    end
    puts "Goodbye!"
  end
end

class Mastermind
  attr_reader :guesses

  def initialize
    @guesses = []
  end

  def run(input)
    guesses << input
    answers = ["p", "i", "q", "c"]
    if answers.include?(input)
      automated_responses(input)
    else
      keep_guessing(input)
    end
  end

  def automated_responses(input)
    responses= {"p" => "Let's play! I have generated a beginner sequence with
                four elements made up of: (r)ed, (g)reen, (b)lue, and (y)ellow.
                Use (q)uit at any time to end the game. What's your guess?",
                "i" => "To play, enter a sequence of 4 letters. Ex: ghty",
                "q" => "Thanks for playing!",
                "c" => "The secret code is rgby. You've taken #{@guesses.count-1} guesses!"}
    responses[input]
  end

  def keep_guessing(input)
    secret = "rgby"
    if input.length != 4
      "Your guess can only be 4 characters long!"
    elsif input == secret
      "You Win! Do you want to (p)lay again or (q)uit?"
    else
      "Guess again! You've taken #{@guesses.count-1} guesses!"
    end
  end
end

Game.new.play

# 'RRGB' has 3 of the correct elements with 2 in the correct position
# Congratulations! You guessed the sequence 'GRRB' in 8 guesses over 4 minutes,
# 22 seconds.