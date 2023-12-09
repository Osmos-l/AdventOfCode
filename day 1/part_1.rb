def event_description()
    puts "Day 1 - Advent of Code 2023"
end

def handle_main_crash(error)
    puts "An error occured"
    puts error.class
    puts error.message
    puts error.trace
end

def main()
    begin
        event_description()

        file = File.open("data.txt")

        total_file = 0
        file_lines = file.readlines

        puts "Lines to read: #{file_lines.length}"
        file_lines.each do |line, i|
            total_line = 0
            # Keeping only numbers
            line_numbers = line.gsub(/[^0-9]/, '')

            # Do we have at least 2 values ?
            line_length = line_numbers.length
            if line_length >= 2
                # Yes ? Combining first and last value
                total_line = "#{line_numbers[0]}#{line_numbers[line_length -1]}".to_i
            else 
                # No ? Combining by itself
                total_line = (line_numbers[0] * 2).to_i
            end
            total_file = total_file + total_line
        end

        puts "Res: #{total_file}"

    rescue => error
        handle_main_crash(error)
    end
end

main()