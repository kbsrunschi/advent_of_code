f = File.read("input.txt").lines.map &:split
data = Array.new
f.each { |x| data.push x[0].to_i}

# data = [0,3,0,1,-3]
#test output = 5
#new test output answer = 10

counter = 0
maze_boundary = data.length
pos = 0
while pos < maze_boundary do
  case
  when 3 > data[pos]
    new_pos = pos + data[pos]
    data[pos] += 1
    pos = new_pos
    counter += 1
  when data[pos] >= 3
    new_pos = pos + data[pos]
    data[pos] -= 1
    pos = new_pos
    counter += 1
  end
end

puts "Total Steps: #{counter}"
puts "Ending offsets: #{data.inspect}"
#Answer pt 1 388611
#Answer pt 2 27763113
