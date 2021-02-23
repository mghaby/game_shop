require "tty-prompt"
require 'json'
prompt = TTY::Prompt.new
leave = "Thanks for visiting Mark's Game Store!"
consoles_hash = JSON.parse(File.read('./db/consoles.json'))
games_hash = JSON.parse(File.read('./db/games.json'))
peripherals_hash = JSON.parse(File.read('./db/peripherals.json'))


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
        # tty table stuff here nicely 
        puts consoles_hash

    when "Games"
        puts "Games"

    when "Peripherals"
        puts "peripheral"
    end
    
when false
    puts leave
end 