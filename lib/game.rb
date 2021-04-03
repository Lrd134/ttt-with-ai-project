class Game
    attr_accessor :board, :player_1, :player_2
    WIN_COMBINATIONS= [
        [0, 1, 2], [3, 4, 5], [6, 7, 8],
        [0, 4, 8], [2, 4, 6],
        [0, 3, 6], [1, 4, 7], [2, 5, 8]
    ]
    def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
        @player_1 = player_1
        @player_2 = player_2
        @board = board
    end
    def current_player
       board.turn_count.odd? ? player_2 : player_1
    end
    def won?
        WIN_COMBINATIONS.detect do |combo|
            if @board.cells[combo[0]] == @board.cells[combo[1]] && @board.cells[combo[2]] == @board.cells[combo[1]] && @board.taken?(combo[0])
                return combo
            end
        end
        return false
    end
    def draw?
        !won? && @board.full?
    end
    def over?
        won? || @board.full?
    end
    def winner
        # binding.pry
        if won?
            if @board.cells[won?[0]] == " "
                return nil
            end
            @board.cells[won?[0]]
        else
            return nil
        end
    end
    
    def turn
             
        puts "Please choose a number 1-9 to make your move."

        input = current_player.move(@board)
        
        
        if @board.valid_move?(input)
            @board.update(input, current_player)
        else
            turn
        end
        
        
    end
    # def play
    #     if !over?

    #         turn
    #     end
    #     if over?
    #         if draw?
    #         puts "Cat's Game!"
    #         elsif won?
    #         puts "Congratulations #{winner}, you've won!"
    #         end
    #     end
        
    # end
    def play
        
        turn until over? || draw?
        if draw? 
            puts "Cat's Game!"
        elsif won?
            puts "Congratulations, #{winner}" 
        end

    end


end