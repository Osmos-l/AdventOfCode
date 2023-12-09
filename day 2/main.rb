module Event
    # AdventOfCode Settings
    NB_RED_CUBES_LOADED = 12
    NB_GREEN_CUBES_LOADED = 13
    NB_BLUE_CUBES_LOADED = 14

    # Other Settings
    EVENT_DATE_FILE = "data.txt"
    DAY = 2

    def self.event_description()
        puts "Day #{DAY} - Advent of Code 2023"
        puts "(https://adventofcode.com/2023/day/#{DAY})"
        puts ""
    end
    
    def self.get_event_data()
        return File.open(EVENT_DATE_FILE).readlines
    end

    def self.main()
        event_description()

        games = get_event_data()
        
        nb_games = games.length
        puts "Games to treat: #{nb_games}"

        res = 0
        games.each do |game|
            splited_game = game.split(":")

            game_id = splited_game[0].gsub(/[^0-9]/, '').to_i
            game_draw = splited_game[1].gsub(";", ",")

            is_realisable = true
            game_draw.split(",").each do |draw|
                splited_draw = draw.split(" ")

                cubes_showed = splited_draw[0].to_i
                cubes_color = splited_draw[1]

                # Does the Elf show us more cubes than possible ?
                is_realisable = case cubes_color
                                when "red"
                                    cubes_showed <= NB_RED_CUBES_LOADED
                                when "green"
                                    cubes_showed <= NB_GREEN_CUBES_LOADED
                                when "blue"
                                    cubes_showed <= NB_BLUE_CUBES_LOADED
                                end
                # The Elf showed us more cubes than possible -> this drame isn't realisable
                break if !is_realisable
            end

            res = res + game_id if is_realisable
        end

        puts "Res: #{res}"
    end

end



Event.main()