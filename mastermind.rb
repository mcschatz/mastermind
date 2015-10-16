class Mastermind

  def initialize(input)
    @message = input
  end

  def welcome(input)
    puts "Welcome to Mastermind! Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
    print "> "
    input = input
  end

  If they enter p or play then they enter the game flow described below.
  If they enter i or instructions they should be presented with a short explanation of how the game is played.
  If they enter q or quit then the game should exit

  welcome


# class Mastermind
#   attr_reader :message, :status

#   def initialize(inputs)
#     @message = inputs[:message]
#     @status  = inputs[:status]
#   end

#   def run
#     puts "Welcome to Mastermind"

#     mastermind = Mastermind.new
#     response = nil

#     until response && response.status == :won
#       print "> "
#       input = gets.chomp
#       response = mastermind.execute(input)
#       puts response.message
#     end
#     puts "Goodbye!"
#   end
# end

# def response(input)
#   secret = "BBGB"
#   if input == secret
#     @message = "You Win!"
#     @status = "won"
#   else
#     @message = "Guess again!"
#     @status = "continue"
#   end
# end