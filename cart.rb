class Cart
    attr_accessor :consoles, :games, :peripherals

    def initialize
        @consoles = []
        @games = []
        @peripherals = []
    end

    def add_console(input)
        @consoles << input
    end

    def add_game(input)
        @games << input
    end

    def add_peripheral(input)
        @peripherals << input
    end

    def combine
        combined = @consoles.sum + @games.sum + @peripherals.sum
    end


end