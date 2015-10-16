class Game
  def play
    puts "Welcome to MASTERMIND. Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
    mastermind = Mastermind.new
    response = nil
    until response && response.status == :end
      print "> "
      input = gets.chomp.downcase
      response = mastermind.execute(input)
      puts response.message
    end
    puts "Goodbye!"
  end
end

class Response
  attr_reader :message, :status, :guesses

  def initialize(inputs)
    @message = inputs[:message]
    @status  = inputs[:status]
  end
end

class Mastermind
  attr_reader :guesses

  def initialize
    @guesses = []
  end

  def execute(input)
    guesses << input

    if input == "p"
      Response.new(message: "Let's play! I have generated a beginner sequence with four elements made up of: (r)ed, (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game. What's your guess?")
    elsif input == "i"
      Response.new(message: "To play, enter a sequence of 4 letters. Ex: ghty")
    elsif input == "q"
      Response.new(status: :end)
    elsif input == "c"
      Response.new(message: "The secret code is rgby. You've taken #{@guesses.count-1} guesses!")
    elsif input.length == 4
      keep_guessing(input)
    elsif input.length < 4
        Response.new(message: "Your guess is too short! It must be 4 characters long! You've taken #{@guesses.count-1} guesses!")
    else input.length > 4
        Response.new(message: "Your guess is too long! It can only be 4 characters long! You've taken #{@guesses.count-1} guesses!")
    end
  end

  def keep_guessing(input)
    secret = "rgby"
    if input == secret
      Response.new(message: "You Win! Do you want to (p)lay again or (q)uit?")
    else
      Response.new(message: "Guess again! You've taken #{@guesses.count-1} guesses!")
    end
  end
end

Game.new.play

# 'RRGB' has 3 of the correct elements with 2 in the correct position
# Congratulations! You guessed the sequence 'GRRB' in 8 guesses over 4 minutes,
# 22 seconds.