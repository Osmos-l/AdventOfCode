module Event
    # AdventOfCode Settings
    NB_RED_CUBES_LOADED = 12
    NB_GREEN_CUBES_LOADED = 13
    NB_BLUE_CUBES_LOADED = 14

    # Other Settings
    EVENT_DATA_FILE = "data.txt"
    DAY = 2

    def self.event_description()
        puts "Day #{DAY} - Advent of Code 2023"
        puts "(https://adventofcode.com/2023/day/#{DAY})"
        puts ""
    end
    
    def self.get_event_data()
        return File.open(EVENT_DATA_FILE).readlines
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

            nb_red_min = 0
            nb_green_min = 0
            nb_blue_min = 0

            game_draw.split(",").each do |draw|
                splited_draw = draw.split(" ")

                cubes_showed = splited_draw[0].to_i
                cubes_color = splited_draw[1]

                case cubes_color
                when "red"
                    nb_red_min = cubes_showed if cubes_showed > nb_red_min
                when "green"
                    nb_green_min = cubes_showed if cubes_showed > nb_green_min
                when "blue"
                    nb_blue_min = cubes_showed if cubes_showed > nb_blue_min
                end

            end

            res = res + (nb_red_min * nb_green_min * nb_blue_min)
        end

        puts "Res: #{res}"
    end

end



Event.main()