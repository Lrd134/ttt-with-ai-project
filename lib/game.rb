class Game
    attr_accessor :board, :player_1, :player_2
    WIN_COMBINATIONS = [
        [0,1,2], # Top row
        [3,4,5], # Middle row
        [6,7,8], # Bottom row
        [0,3,6], # Bottom-to-top, left to right
        [2,5,8], # Top-to-bottom, right to left
        [8,4,0], # Bottom-to-top, right to left
        [1,4,7], # Top-to-bottom, center
        [2,4,6]  # Top-to-bottom, left side
        # et cetera, creating a nested array for each win combination
    ]
    def initialize(p1 = Player::Human.new("X"),p2,boad)
        @player_1 = p1
        @player_2 = p2
        @board = boad
    end

end