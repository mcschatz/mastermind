class Game
  def play
    puts "Welcome to MASTERMIND. Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
    mastermind = Mastermind.new
    response = nil
    until response && response.status == :won
      print "> "
      input = gets.chomp.downcase
      response = mastermind.execute(input)
      puts response.message
    end
    puts "Goodbye!"
  end
end

class Response
  attr_reader :message, :status

  def initialize(inputs)
    @message = inputs[:message]
    @status  = inputs[:status]
  end
end

class Mastermind
  def execute(input)
    if input == "p"
      Response.new(message: "Let's play! I have generated a beginner sequence with four elements made up of: (r)ed, (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game. What's your guess?")
    elsif input == "i"
      Response.new(message: "Some Intructions")
    elsif input == "q"
      Response.new(status: :won)
    elsif input == "c"
      Response.new(message: "The secret code is rgby")
    elsif input.length == 4
      secret = "rgby"
      if input == secret
        Response.new(message: "You Win!", status: :won)
      else
        Response.new(message: "Guess again!")
      end
    elsif input.length < 4
        Response.new(message: "Your guess is too short! It must be 4 characters long!")
    else input.length > 4
        Response.new(message: "Your guess is too long! It can only be 4 characters long!")
    end
  end
end

Game.new.play

# Otherwise give them feedback on the guess like this:
# 'RRGB' has 3 of the correct elements with 2 in the correct positions
# You've taken 1 guess
# Congratulations! You guessed the sequence 'GRRB' in 8 guesses over 4 minutes,
# 22 seconds.

# Do you want to (p)lay again or (q)uit?
# If they enter 'p' or 'play' then restart the game. 'q' or 'quit' ends the game.