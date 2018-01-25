class Player

	attr_accessor :name, :symb

	def initialize(player_id, symb)
		puts "#{player_id}, Enter your name : "
		@name = gets.chomp
		@symb = symb 
	end
end

class Case

	attr_accessor :id 
	attr_accessor :status

	def initialize(id, val)
		@id = id
		@status = val
	end

end


class Board

	def initialize


		$c1 = Case.new(1, " ")
		$c2 = Case.new(2, " ")
		$c3 = Case.new(3, " ")
		$c4 = Case.new(4, " ")
		$c5 = Case.new(5, " ")
		$c6 = Case.new(6, " ")
		$c7 = Case.new(7, " ")
		$c8 = Case.new(8, " ")
		$c9 = Case.new(9, " ")

	end

	def display_board



		tab = " #{$c1.status} \| #{$c2.status} \| #{$c3.status} \n\-\-\-\|\-\-\-\|\-\-\- \n #{$c4.status} \| #{$c5.status} \| #{$c6.status} \n\-\-\-\|\-\-\-\|\-\-\- \n #{$c7.status} \| #{$c8.status} \| #{$c9.status} "

		puts tab

	end
end


class Game

	def initialize
		@turn = 0
		@choice_left = ["1","2","3","4","5","6","7","8","9"]
	end

	def game_start
		@players = []
		@players[0] = Player.new("Player1", "X")
		@players[1] = Player.new("Player2", "O")

		@board = Board.new
		@board.display_board
		while true
			play_turn
			if win_combination_check == true
				puts "winner winner chicken dinner"
				break

			elsif @turn == 8
				puts "That's a DRAW"
				break
			end
			@turn += 1
		end

	end

	def play_turn

		@current_player = @players[@turn%2].name
		puts "#{@current_player}'s turn, pick a case :"
		@player_choice = ""

		while true
			@player_choice = gets.chomp

			unless @choice_left.include?(@player_choice)
				puts "mhmh nah bad idea! Pick a number not taken between 1 and 9 \n choices left : #{@choice_left}"
			else
				@choice_left.delete(@player_choice)
				break
			end
		end

			case @player_choice
				when "1"
					$c1.status = @players[@turn%2].symb
				when "2"
					$c2.status = @players[@turn%2].symb
				when "3"
					$c3.status = @players[@turn%2].symb
				when "4"
					$c4.status = @players[@turn%2].symb
				when "5"
					$c5.status = @players[@turn%2].symb
				when "6"
					$c6.status = @players[@turn%2].symb
				when "7"
					$c7.status = @players[@turn%2].symb
				when "8"
					$c8.status = @players[@turn%2].symb
				when "9"
					$c9.status = @players[@turn%2].symb
			end

			@board.display_board
			

	end


	def win_combination_check

		@tab = [[$c1.status,$c2.status,$c3.status],[$c4.status,$c5.status,$c6.status],[$c7.status,$c8.status,$c9.status]]

   (0..2).each do |i|
      if @tab[i][0] == @tab[i][1] && @tab[i][1] == @tab[i][2]
        return true unless @tab[i][0] == " "

      elsif @tab[0][i] ==@tab[1][i] && @tab[1][i] == @tab[2][i]
        return true unless @tab[0][i] == " "
      end
    end

     if ( @tab[0][0] == @tab[1][1] && @tab[1][1] == @tab[2][2] ) ||
       ( @tab[0][2] == @tab[1][1] && @tab[1][1] == @tab[2][0] )
      return true unless @tab[1][1] == " "
    else
    	return false
    end
			

	end




end

game = Game.new
game.game_start