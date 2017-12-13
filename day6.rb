data = [11, 11, 13, 7, 0, 15, 5, 5, 4, 4, 1, 1, 7, 1,15, 11]
#Test answer: 5 redistribution cycles before a repeat

history = Hash.new
# data = [0,2,7,0]
history[0] = [11, 11, 13, 7, 0, 15, 5, 5, 4, 4, 1, 1, 7, 1,15, 11]
# history[0] = [0,2,7,0]
iterations = 1
found_match = false
dt_length = data.length
matching_index = 0
while !found_match do
  max = data.max
  pos = data.find_index(max)
  start_index = data.find_index(max)
  data[pos] = 0
  cycles = (max / dt_length.to_f).ceil
  while max > 0 do
    if pos + 1 <= dt_length - 1 && pos >= start_index
      pos += 1
      data[start_index+1..-1].each_with_index do |value, index|
        data[pos] += 1 unless max == 0
        max -= 1
        pos += 1
      end
    else
      pos = 0
      data.each_with_index do |value, index|
        data[pos] += 1 unless max <= 0
        max -= 1
        pos += 1
      end
    end
  end
  history.each_with_index do |value, index|
    if history[index] == data
      found_match = true
      matching_index = index
    end
  end
  final =  []
  data.each_with_index do |value, index|
    final[index] = value
  end
  history[iterations] = final
  iterations += 1
end
puts "It took #{iterations - 1} iterations to find a repeat"
puts "matching index: #{matching_index}"
puts history[matching_index]
puts history[iterations]
puts "The number of cycles taken were #{iterations - 1 - matching_index}"
#Answer 4074, 2793
