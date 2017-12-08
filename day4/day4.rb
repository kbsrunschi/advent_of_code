data = Hash.new
File.open("input.txt").each_with_index do |line, index|
  data[index] = line.split(" ")
end
# data[0] = "aa bb cc dd aaa".split(" ")
# data[1] = "aa bb cc dd aa".split(" ")
# data[2] = "aa bb cc dd ee".split(" ")

valid_keys = 0
data.map do |key, row|
  found_match = false
  row.each_with_index do |value, index|
    [*index..(row.length - 1)].each do |place|
      compare = row[place+1]
      puts "Comparing #{value} with #{compare}"
      if !compare.nil? && value == compare
        found_match = true
      end
    end
  end
  valid_keys += 1 if !found_match
end

puts "Answer: #{valid_keys}"
#Answer 383

puts "Solving Part 2..."

data[0] = "abcde fghij".split(" ")
data[1] = "abcde xyz ecdab".split(" ")
data[2] = "a ab abc abd abf abj".split(" ")
data[3] = "iiii oiii ooii oooi oooo".split(" ")
data[4] = "oiii ioii iioi iiio".split(" ")
#Sample data answer is 3


