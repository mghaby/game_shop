require "tty-prompt"
require 'tty-table'
require 'json'
prompt = TTY::Prompt.new
leave = "Thanks for visiting Mark's Game Store!"
consoles_hash = JSON.parse(File.read('./db/consoles.json'))
games_hash = JSON.parse(File.read('./db/games.json'))
peripherals_hash = JSON.parse(File.read('./db/peripherals.json'))

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

yn = prompt.yes?("Would you like to enter Mark's Game Store?")
case yn
when true
    selection = prompt.select("What would you like to purchase?", %w(Consoles Games Peripherals))
    case selection
    when "Consoles"
        puts console_table.render(:ascii)

    when "Games"
        puts game_table.render(:ascii)

    when "Peripherals"
        puts peripheral_table.render(:ascii)
    end
    
when false
    puts leave
end 