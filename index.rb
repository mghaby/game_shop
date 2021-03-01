# dependencies
require "tty-prompt"
require 'tty-table'
require 'json'
prompt = TTY::Prompt.new
leave = "Thanks for visiting Mark's Game Store!"
consoles_hash = JSON.parse(File.read('./db/consoles.json'))
games_hash = JSON.parse(File.read('./db/games.json'))
peripherals_hash = JSON.parse(File.read('./db/peripherals.json'))
require_relative './cart'

# table setups 
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

# main loop
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
                puts ""
                puts "Successfully added PS4 to Cart!"
                    selection_loop = prompt.yes?("Would you like to purchase anything else?")
                    case selection_loop
                        when true
                            puts ""
                        when false
                            puts ""
                            break
                    end

                when "PS5"
                cart.add_console(700)
                puts ""
                puts "Successfully added PS4 to Cart!"
                selection_loop = prompt.yes?("Would you like to purchase anything else?")
                    case selection_loop
                        when true
                            puts ""
                        when false
                            puts ""
                            break
                    end

                when "Switch"
                cart.add_console(450)
                puts ""
                puts "Successfully added Nintendo Switch to Cart!"
                selection_loop = prompt.yes?("Would you like to purchase anything else?")
                    case selection_loop
                        when true
                            puts ""
                        when false
                            puts ""
                            break
                    end

                when "XboxOne"
                cart.add_console(300)
                puts ""
                puts "Successfully added Xbox One to Cart!"
                selection_loop = prompt.yes?("Would you like to purchase anything else?")
                    case selection_loop
                        when true
                            puts ""
                        when false
                            puts ""
                            break
                    end

                when "XboxX"
                cart.add_console(500)
                puts ""
                puts "Successfully added Xbox Series X to Cart!"
                selection_loop = prompt.yes?("Would you like to purchase anything else?")
                    case selection_loop
                        when true
                            puts ""
                        when false
                            puts ""
                            break
                    end

                end


        when "Games"
            puts game_table.render(:ascii)
            puts ""
                selection_game = prompt.select("Which game would you like?", %w(COD AC:V SSB NBA Valheim))
                case selection_game
                when "COD"
                cart.add_game(90)
                puts ""
                puts "Successfully added Call of Duty: Black Ops: Cold War to Cart!"
                selection_loop = prompt.yes?("Would you like to purchase anything else?")
                    case selection_loop
                        when true
                            puts ""
                        when false
                            puts ""
                            break
                    end

                when "AC:V"
                cart.add_game(90)
                puts ""
                puts "Successfully added Assassin's Creed: Valhalla to Cart!"
                selection_loop = prompt.yes?("Would you like to purchase anything else?")
                    case selection_loop
                        when true
                            puts ""
                        when false
                            puts ""
                            break
                    end

                when "SSB"
                cart.add_game(70)
                puts ""
                puts "Successfully added Super Smash Bros. Ultimate to Cart!"
                selection_loop = prompt.yes?("Would you like to purchase anything else?")
                    case selection_loop
                        when true
                            puts ""
                        when false
                            puts ""
                            break
                    end
                
                when "NBA"
                cart.add_game(60)
                puts ""
                puts "Successfully added NBA 2K21 to Cart!"
                selection_loop = prompt.yes?("Would you like to purchase anything else?")
                    case selection_loop
                        when true
                            puts ""
                        when false
                            puts ""
                            break
                    end

                when "Valheim"
                cart.add_game(30)
                puts ""
                puts "Successfully added Valheim to Cart!"
                selection_loop = prompt.yes?("Would you like to purchase anything else?")
                    case selection_loop
                        when true
                            puts ""
                        when false
                            puts ""
                            break
                    end

                end

        when "Peripherals"
            puts peripheral_table.render(:ascii)
            puts ""
                selection_peripheral = prompt.select("Which peripheral would you like?", %w(Headphones Keyboard Mouse Mousepad Speakers))
                case selection_peripheral
                when "Headphones"
                cart.add_peripheral(70)
                puts ""
                puts "Successfully added Hyper X Headphones to Cart!"
                selection_loop = prompt.yes?("Would you like to purchase anything else?")
                    case selection_loop
                        when true
                            puts ""
                        when false
                            puts ""
                            break
                    end

                when "Keyboard"
                cart.add_peripheral(200)
                puts ""
                puts "Successfully added Logitech Keyboard to Cart!"
                selection_loop = prompt.yes?("Would you like to purchase anything else?")
                    case selection_loop
                        when true
                            puts ""
                        when false
                            puts ""
                            break
                    end

                when "Mouse"
                cart.add_peripheral(120)
                puts ""
                puts "Successfully added Razer Mouse to Cart!"
                selection_loop = prompt.yes?("Would you like to purchase anything else?")
                    case selection_loop
                        when true
                            puts ""
                        when false
                            puts ""
                            break
                    end

                when "Mousepad"
                cart.add_peripheral(30)
                puts ""
                puts "Successfully added Razer Mousepad to Cart!"
                selection_loop = prompt.yes?("Would you like to purchase anything else?")
                    case selection_loop
                        when true
                            puts ""
                        when false
                            puts ""
                            break
                    end

                when "Speakers"
                cart.add_peripheral(120)
                puts ""
                puts "Successfully added Sony Speakers to Cart!"
                selection_loop = prompt.yes?("Would you like to purchase anything else?")
                    case selection_loop
                        when true
                            puts ""
                        when false
                            puts ""
                            break
                    end
                
                end

        end
    end

    # discount & calculation logic 
    games_count = cart.games.count
    case games_count
    when 3..4
        temp = cart.games.sum * 0.1 
        cart.games[0] = cart.games.sum - temp.to_i

    when 5..9
        temp = cart.games.sum * 0.15
        cart.games[0] = cart.games.sum - temp.to_i
    
    when 10..99
        temp = cart.games.sum * 0.25 
        cart.games[0] = cart.games.sum - temp.to_i
    end

    puts "Your total is $ #{cart.combine}"
when false
    puts leave
end 