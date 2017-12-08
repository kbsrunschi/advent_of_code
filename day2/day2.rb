data = Hash.new
 File.open("input.txt").each_with_index do |line, index|
   data[index] = line.split("\t")
 end
# data[0] = [5,9,2,8]
# data[1] = [9,4,7,3]
# data[2] = [3,8,6,5]

check_sum = 0
data.map do |key, row|
  puts "Max: #{row.map!(&:to_i).max}, Min: #{row.map!(&:to_i).min}"
  check_sum += row.map!(&:to_i).max - row.map!(&:to_i).min
end
puts check_sum
# Answer to part 1: 54426

puts "Starting part 2!"

check_sum2 = 0
row_length = data[0].length
puts row_length
data.map do |key, row|
  row.each_with_index do |value, index|
    [*index..(row_length-1)].each do |place|
      puts "#{value} vs #{row[place+1]}"
      compare = row[place+1]
      if !compare.nil? && (value % compare == 0 || compare % value == 0) && index < row.length - 1
        puts "#{value} % #{compare} == 0 or #{compare} % #{value} == 0"
        check_sum2 += value % compare == 0 ? value / compare : compare / value
      end
    end
  end
end

puts "End result: #{check_sum2}"
# Answer: 333
