
module Players 

    class Human < Player
        

        def move(board)
            # board.display
            # puts "Please choose a number 1-9 to make your move."
            input = gets.strip
            input
        end
    end

end