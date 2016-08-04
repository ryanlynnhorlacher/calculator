@storage = []
@memory = []
@store = []

def get_input
	puts "--Welcome to Ruby Calc--"
	puts "Use clear, history, store, recall, or quit at anytime."
	puts "Enter first number"
	input = []
	while
		input[0] = gets.strip
		case input[0]
		when /^[+-]?[0-9]*\.?[0-9]+$/
			break
		else
			alt_commands(input[0])
			puts "Please enter a number"
		end
	end
	while true
		puts "Enter an operator"
		while true
	  	input[1] = gets.strip
	  	case input[1]
	  	when "*", "+", "-", "/", "**", "%"
	      break
	    else
	    	alt_commands(input[1])
	    	puts "Please use a valid operator"
	    end
	  end
	  puts "Enter another number"
	  while true
	  	input[2] = gets.strip
		  case input[2]
		  when /^[+-]?[0-9]*\.?[0-9]+$/	
		  	break
		  else
		  	alt_commands(input[2])
		  	puts "Please enter a number"
		  end
		end
		output = input[0].to_f.send(input[1], input[2].to_f)
		@store[0] = "#{input[0]} #{input[1]} #{input[2]} = #{output.round(6)}"
		puts @store[0]
		@storage <<@store[0]
		input[0] = output
	end
end

def alt_commands(commands)
	case commands.downcase
	when "menu"
		puts "clear: clears all memory and restarts calc"
		puts "history: shows recent history"
		puts "store: stores most recent output"
		puts "recall: recalls most recent output"
		puts "quit: exits the calc"
	when "clear"
		puts "CLEARED"
		get_input
	when "history"
		if @storage.empty? 
			puts "No history to show"
		else
			puts @storage
		end
	when "store"
		if @store.empty?
			 puts "Nothing to store"
		else
			@memory[0] = @store[0]
			puts "OUTPUT STORED: #{@memory}"
		end
	when "recall"
		if @memory.empty?
			puts "Nothing to recall"
		else
		puts "STORED VALUE #{@memory}"
		end
	when "quit"
		puts "Thank you for using Ruby Calc"
		exit(0)
	end
end


get_input