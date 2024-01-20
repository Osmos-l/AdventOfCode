module Event
    # AdventOfCode Settings
    SEPARATOR = "."

    # Other Settings
    EVENT_DATA_FILE = "data.txt"
    DAY = 3

    def self.event_description()
        puts "Day #{DAY} - Advent of Code 2023"
        puts "(https://adventofcode.com/2023/day/#{DAY})"
        puts
    end
    
    def self.get_event_data()
        return File.open(EVENT_DATA_FILE).readlines
    end

    def self.forEachEngine(engine_schematic, &block)
        for y in 0 .. (engine_schematic.length() -1) do
            engine_schematic[y] = engine_schematic[y].gsub("\n", "")

            for x in 0 .. (engine_schematic[y].length() -1) do 
                yield engine_schematic[y][x], [ x, y ]
            end
        end
    end

    def self.forEachSurrounding(engine_schematic, cords, &block)
        x, y = *cords

        callAtCords(engine_schematic, [x, y -1],    &block) # top
        callAtCords(engine_schematic, [x +1, y -1], &block) # top & right
        callAtCords(engine_schematic, [x +1, y],    &block) # right
        callAtCords(engine_schematic, [x +1, y +1], &block) # bottom & right
        callAtCords(engine_schematic, [x, y +1],    &block) # bottom
        callAtCords(engine_schematic, [x -1, y +1], &block) # bottom & left
        callAtCords(engine_schematic, [x -1, y],    &block) # left
        callAtCords(engine_schematic, [x -1, y -1], &block) # top & left
    end

    def self.callAtCords(engine_schematic, cords, &block)
        x, y = *cords

        yield engine_schematic[y][x], cords if engine_schematic[y] && engine_schematic[y][x]
    end

    def self.extractNumber(engine_schematic, cords)
        number = ""
        x, y = *cords

        while isNumber(engine_schematic[y][x])
            x = x -1
        end

        # Will end up one too small
        x = x +1 

        while isNumber(engine_schematic[y][x])
            number = number + engine_schematic[y][x]
            engine_schematic[y][x] = "." # Prevent couting twice
            x = x +1
        end

        return number.to_i
    end

    def self.isGear(char)
        return char == "*"
    end

    def self.isNumber(char)
        return char.to_i.to_s == char.to_s
    end

    def self.main()
        event_description()

        engine_schematic = get_event_data()

        sum = 0

        forEachEngine(engine_schematic) do |char, char_cords|
            if isGear(char)
                partNumbers = []

                forEachSurrounding(engine_schematic, char_cords) do |surrounder, surrounder_cords|
                    partNumbers.push(extractNumber(engine_schematic, surrounder_cords)) if isNumber(surrounder)
                end

                if partNumbers.length == 2
                    sum = sum + partNumbers[0] * partNumbers[1]
                end
            end
        end
        puts "Sum: #{sum}"
       
    end

end



Event.main()