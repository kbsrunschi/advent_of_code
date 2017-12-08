sample = File.read("input.txt").split("")
# sample = "1212\n".split("")
sample = sample.reverse.drop(1).reverse
first = sample[0]
length = sample.length
puts sample.length
matched_nums = 0
sample.each_with_index { |num, index| matched_nums += num.to_i if num  == sample[index+1]; matched_nums += num.to_i if (index == length - 2) && num == first; }
puts "Total Sum for first part: #{matched_nums}"
#correct answer: 1182

puts "Trying second part!..."
matched_nums = 0
steps_ahead = sample.length / 2
puts "Sample has #{sample.length} and will be looking #{steps_ahead}"
copy = sample
sample.cycle(2).each_with_index do |num, index|
  if index + steps_ahead < length
    puts "Comparing: #{num} to #{copy[index + steps_ahead]}"
    matched_nums += num.to_i if num == copy[index + steps_ahead]
  elsif (steps_ahead - index).abs <= steps_ahead - 1
    reset_index = (steps_ahead - index).abs
    puts reset_index
    puts "Went around and comparing #{num} to #{copy[reset_index]}"
    matched_nums += num.to_i if num == copy[reset_index]
  end
end
puts "Total: #{matched_nums}"

#answer: 1152
