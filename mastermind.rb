class Runner
  def run
    puts "Welcome to MASTERMIND. Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
    mastermind = Mastermind.new
    response = nil
    until response && response.status == :won
      print "> "
      input = gets.chomp
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
      Response.new(message: "Let's play!")
    elsif input == "i"
      Response.new(message: "Some Intructions")
    else input == "q"
      Response.new(message: "Goodbye!")
    end
  end
end

Runner.new.run
#   I have generated a beginner sequence with four elements made up of: (r)ed,
# (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game.
# What's your guess?
# Guesses are case insensitive
# If it's 'q' or 'quit' then exit the game
# If it's 'c' or 'cheat' then print out the current secret code
# If it's fewer than four letters, tell them it's too short
# If it's longer than four letters, tell them it's too long
# If they guess the secret sequence, enter the end game flow below
# Otherwise give them feedback on the guess like this:
# 'RRGB' has 3 of the correct elements with 2 in the correct positions
# You've taken 1 guess
# Congratulations! You guessed the sequence 'GRRB' in 8 guesses over 4 minutes,
# 22 seconds.

# Do you want to (p)lay again or (q)uit?
# If they enter 'p' or 'play' then restart the game. 'q' or 'quit' ends the game.