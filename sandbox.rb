sentence = "nineightabc2x3oneight" 

sentence["one"] = "o1e"

p sentence


mapping_table = { 'one' => 'o1e', 'two' => 't2o', 'three' => 't3e', 'four' => 'f4r', 'five' => 'f5e', 'six' => 's6x', 'seven' => 's7n', 'eight' => 'e8t', 'nine'  => 'n9e' }
    
while sentence =~ /one|two|three|four|five|six|seven|eight|nine/ do

    mapping_table.each do |v, k|
        sentence[v] = k if sentence[v]
    end
    
    p sentence 
   
end