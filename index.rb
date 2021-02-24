require "tty-prompt"
require 'tty-table'
require 'json'
prompt = TTY::Prompt.new
leave = "Thanks for visiting Mark's Game Store!"
consoles_hash = JSON.parse(File.read('./db/consoles.json'))
games_hash = JSON.parse(File.read('./db/games.json'))
peripherals_hash = JSON.parse(File.read('./db/peripherals.json'))
require_relative './cart'

game_table = TTY::Table.new(["Game","Price"], [[games_hash[0]["name"], games_hash[0]["price"]],
    [games_hash[1]["name"], games_hash[1]["price"]],
    [games_hash[2]["name"], games_hash[2]["price"]],
    [games_hash[3]["name"], games_hash[3]["price"]],
    [games_hash[4]["name"], games_hash[4]["price"]]
    ])

console_table = TTY::Table.new(["Console","Price"], [[consoles_hash[0]["name"], consoles_hash[0]["price"]],
    [consoles_hash[1]["name"], consoles_hash[1]["price"]],
    [consoles_hash[2]["name"], consoles_hash[2]["price"]],
    [consoles_hash[3]["name"], consoles_hash[3]["price"]],
    [consoles_hash[4]["name"], consoles_hash[4]["price"]]
    ])


peripheral_table = TTY::Table.new(["Peripheral","Price"], [[peripherals_hash[0]["name"], peripherals_hash[0]["price"]],
    [peripherals_hash[1]["name"], peripherals_hash[1]["price"]],
    [peripherals_hash[2]["name"], peripherals_hash[2]["price"]],
    [peripherals_hash[3]["name"], peripherals_hash[3]["price"]],
    [peripherals_hash[4]["name"], peripherals_hash[4]["price"]]
 ])

puts "_    _      _ _       
| |  | |    | | |      
| |__| | ___| | | ___  
|  __  |/ _ \ | |/  _ \\ 
| |  | |  __/ | | \(_\) |
|_|  |_|\___|_|_|\_____/ 
"
puts "


Welcome to Mark's Game Store!"
puts "Here we specialise in Consoles, Games and Peripherals"
sleep(3)
puts ""
puts "
_._._                       _._._
_|   |_                     _|   |_
| ... |_._._._._._._._._._._| ... |
| ||| |  o   Game Store   o | ||| |
| ... |  ...    ...    ...  | ... |
|[-|-]| [-|-]  [-|-]  [-|-] |[-|-]|  
|     |---------------------|     | 
| ... |  ...    ...    ...  | ... |
|[-|-]|  :::   .-+-.   :::  |[-|-]|
|     | |~|~|  |_|_|  |~|~| |     |
|_____|_|__|_|_|_|_|__|_|_|_|_____|
              /======\\

"
# ASCII ART ABOVE BY Sher
cart = Cart.new

yn = prompt.yes?("Would you like to enter Mark's Game Store?")
puts ""
case yn
when true
    loop do 
        selection = prompt.select("What would you like to purchase?", %w(Consoles Games Peripherals))
        case selection
        when "Consoles"
            puts console_table.render(:ascii)
            puts ""
                selection_console = prompt.select("Which console would you like?", %w(PS4 PS5 Switch XboxOne XboxX))
                case selection_console
                when "PS4"
                cart.add_console(400)
                puts "Successfully added PS4 to Cart!"
                # use above as template for everything else

                when "PS5"
                cart.add_console(700)
                puts "Successfully added PS4 to Cart!"

                when "Switch"
                cart.add_console(450)
                puts "Successfully added Nintendo Switch to Cart!"

                when "XboxOne"
                cart.add_console(300)
                puts "Successfully added Xbox One to Cart!"

                when "XboxX"
                cart.add_console(500)
                puts "Successfully added Xbox Series X to Cart!"

                end


        when "Games"
            puts game_table.render(:ascii)
            puts ""
                selection_game = prompt.select("Which game would you like?", %w(COD AC:V SSB NBA Valheim))
                case selection_game
                when "COD"
                cart.add_game(90)
                puts "Successfully added Call of Duty: Black Ops: Cold War to Cart!"

                when "AC:V"
                cart.add_game(90)
                puts "Successfully added Assassin's Creed: Valhalla to Cart!"

                when "SSB"
                cart.add_game(70)
                puts "Successfully added Super Smash Bros. Ultimate to Cart!"
                
                when "NBA"
                cart.add_game(60)
                puts "Successfully added NBA 2K21 to Cart!"

                when "Valheim"
                cart.add_game(30)
                puts "Successfully added Valheim to Cart!"

                end

        when "Peripherals"
            puts peripheral_table.render(:ascii)
            puts ""
                selection_peripheral = prompt.select("Which peripheral would you like?", %w(Headphones Keyboard Mouse Mousepad Speakers))
                case selection_peripheral
                when "Headphones"
                cart.add_peripheral(70)
                puts "Successfully added Hyper X Headphones to Cart!"

                when "Keyboard"
                cart.add_peripheral(200)
                puts "Successfully added Logitech Keyboard to Cart!"

                when "Mouse"
                cart.add_peripheral(120)
                puts "Successfully added Razer Mouse to Cart!"

                when "Mousepad"
                cart.add_peripheral(30)
                puts "Successfully added Razer Mousepad to Cart!"

                when "Speakers"
                cart.add_peripheral(120)
                puts "Successfully added Sony Speakers to Cart!"
                
                end

        end
    end
when false
    puts leave
end 