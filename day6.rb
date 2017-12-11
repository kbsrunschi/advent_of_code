# data = [11, 11, 13, 7, 0, 15, 5, 5, 4, 4, 1, 1, 7, 1,15, 11]
data = [0,2,7,0]
#Test answer: 5 redistribution cycles before a repeat

history = Hash.new
iterations = 0
found_match = false
dt_length = data.length

while !found_match do
  max = data.max
  pos = data.find_index(max)
  start_index = data.find_index(max)
  data[pos] = 0
  cycles = (max / dt_length.to_f).ceil
  while max != 0 do
    if pos + 1 <= dt_length - 1
      pos += 1
      data[start_index+1..-1].each_with_index do |value, index|
        puts "#{index}: #{value}"
        data[pos] +=1
        max -= 1
        pos += 1
        puts "#{data.inspect}, moving to pos #{pos}"
      end
    else
      pos = 0
      data.each_with_index do |value, index|
        puts "#{index}: #{value}, pos: #{pos}"
        data[pos] += 1
        max -= 1
        pos += 1
        puts "#{data.inspect}, moving to pos #{pos}"
      end
      pos = 0
    end
  end
  history[iterations] = data
  iterations += 1
  found_match = true
end
