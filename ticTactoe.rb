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

	def initialize()


		@c1 = Case.new(1, " ")
		@c2 = Case.new(2, " ")
		@c3 = Case.new(3, " ")
		@c4 = Case.new(4, " ")
		@c5 = Case.new(5, " ")
		@c6 = Case.new(6, " ")
		@c7 = Case.new(7, " ")
		@c8 = Case.new(8, " ")
		@c9 = Case.new(9, " ")

	end

	def display_board



		tab = " #{@c1.status} \| #{@c2.status} \| #{@c3.status} \n\-\-\-\|\-\-\-\|\-\-\- \n #{@c4.status} \| #{@c5.status} \| #{@c6.status} \n\-\-\-\|\-\-\-\|\-\-\- \n #{@c7.status} \| #{@c8.status} \| #{@c9.status} "

		puts tab

	end
end

bob = Board.new
bob.display_board

