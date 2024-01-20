module Event
    # AdventOfCode Settings
    SEPARATOR = "."

    # Other Settings
    EVENT_DATA_FILE = "data.txt"
    DAY = 4

    def self.event_description()
        puts "Day #{DAY} - Advent of Code 2023"
        puts "(https://adventofcode.com/2023/day/#{DAY})"
        puts
    end
    
    def self.get_event_data()
        return File.open(EVENT_DATA_FILE).readlines
    end

    def self.forEachScrathcards(scrathcards, &block)
        for i in (0 .. scrathcards.length() -1) do
            scrathcard = scrathcards[i].gsub("Card #{i +1}:", "")

            winningNumbers, draw = *scrathcard.split("|")

            # Converting to array of Integer
            winningNumbers = winningNumbers.split(" ").map { |number| number.to_i }
            draw = draw.split(" ").map { |number| number.to_i }

            yield i, winningNumbers, draw
        end
    end

    def self.main()
        event_description()

        sum = 0
        scrathcards = get_event_data()

        forEachScrathcards(scrathcards) do |i, winningNumbers, draw|
            point = 0

            # Intersection
            matches = (winningNumbers & draw).count
            if matches > 0
                point = 2 ** (matches -1)
                sum = sum + point
            end

        end

        puts "Sum: #{sum}"
       
    end

end



Event.main()