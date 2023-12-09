def event_description()
    puts "Day 1 - Advent of Code 2023"
end

def line_preparator(line)
    mapping_table = { 'one' => 'o1e', 'two' => 't2o', 'three' => 't3e', 'four' => 'f4r', 'five' => 'f5e', 'six' => 's6x', 'seven' => 's7n', 'eight' => 'e8t', 'nine'  => 'n9e' }
    
    while line =~ /one|two|three|four|five|six|seven|eight|nine/ do
        mapping_table.each do |v, k|
            line[v] = k if line[v]
        end
    end

    return line
end

def main()
    event_description()

    file = File.open("data.txt")

    total_file = 0
    file_lines = file.readlines

    puts "Lines to read: #{file_lines.length}"
    file_lines.each do |line, i|
        total_line = 0

        puts line
        line = line_preparator(line)
        puts line 

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

        puts "total_line #{total_line}"
        puts
        total_file = total_file + total_line
    end

    puts "Res: #{total_file}"

end

main()