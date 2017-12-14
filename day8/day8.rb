# f = "b inc 5 if a > 1
# a inc 1 if b < 5
# c dec -10 if a >= 1
# c inc -20 if c == 10"
# data[0] = ["b", "inc", "5", "if", "a", ">", "1"]
# data[1] = ["a", "inc", "1", "if", "b", "<", "5"]
# data[2] = ["c", "dec", "-10", "if", "a", ">=", "1"]
# data[3] = ["c", "inc", "-20", "if", "c", "==", "10"]
f = File.read("input.txt").lines.map &:split
data = Hash.new
f.each_with_index do |line, index|
  data[index] = line
end

registers = {}
data.each do |key,value|
  registers[value[0]] = 0 unless registers.include? value[0]
end

actions = { 'inc' => '+', 'dec'=> '-'}
overall_max = 0

data.each do |key, value|
  reg_to_eval = registers[value[4]]
  equation = "#{reg_to_eval} #{value[5..6].join('')}"
  if eval(equation)
    reg_to_modify = value[0]
    op = actions[value[1]]
    amount = value[2]
    equation2 = "#{registers[reg_to_modify]} #{op} #{amount}"
    registers[reg_to_modify] = eval(equation2)
    overall_max = eval(equation2) if eval(equation2) > overall_max
  end
end

max = registers.key(registers.values.max)
puts "Max register is #{max}"
puts "Wins with a max of #{registers[max]}"
#Part 1 Answer: J, 7296
#
puts "Overall max of register ever held is: #{overall_max}"

#Part2 answer: 8186




