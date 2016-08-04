def get_input
	puts "--Welcome to Ruby Calclulator"
	puts "Enter first number"
	input = []
	while
		input[0] = gets.strip
		case input[0]
		when /^[+-]?[0-9]*\.?[0-9]+$/
			break
		else
			puts "Please enter a number"
		end
	end
	puts "Enter an operator"
	while
  	input[1] = gets.strip
  	case input[1]
  	when "*", "+", "-", "/", "**", "%"
      break
    else
    	puts "Please use a valid operator"
    end
  end
  puts "Enter second number"
  while
  	input[2] = gets.strip
	  case input[2]
	  when /^[+-]?[0-9]*\.?[0-9]+$/	
	  	break
	  else
	  	puts "Please enter a number"
	  end
end
  return input
end

def calculate(get_input)
	output = get_input[0].to_f.send(get_input[1], get_input[2].to_f)
	puts "#{get_input[0]} #{get_input[1]} #{get_input[2]} = #{output.round(6)}"
	puts "Play again? (y/n)"
end

def play_again
	puts "Would you like to play again?"
	again = gets.strip
	case again
	when "y"
	when "no"
		quit
	end
end

def quit
	exit(0)
end
		
while true
	calculate(get_input)
	play_again
end