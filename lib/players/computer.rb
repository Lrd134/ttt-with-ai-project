module Players

    class Computer < Player
        def move(board)
            # board.display
             
            input = gets.strip
            position(input)
        end
    end
end