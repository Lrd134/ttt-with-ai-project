require 'pry'
class Board
    attr_accessor :cells
    def initialize
        @cells = Array.new(9, " ")
    end
    def reset!
        @cells = Array.new(9, " ")
    end
    def display
        puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
        puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
        puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
        puts "-----------"
    end
    def position(position)
        @cells[position.to_i - 1]   
    end
    def full?
        @cells.each do | cell |
            if cell == " "
                return false
            end
        end
        true
    end
    def turn_count
        @cells.count { | piece | piece == "X" || piece == "O"}
    end
    def taken?(index)
        position(index) == " " ? false : true
    end
    # def valid_move?(index)
    #     index =~ /\d/ && 



    # end
    def valid_move?(index)
        # if index.to_i < 10 || index.to_i > 0
        #     position(index) == " " ? true 
        !(taken?(index)) && (0..9).include?(index.to_i - 1)
    
    end
    def update(pos, player)
        @cells[pos.to_i - 1] = player.token
    end

end
