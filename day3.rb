data = 26
#data = 325489

def spiral(n)
  if n == 0
    puts "0, 0, 0"
    return
  end
  r = ((Math.sqrt(n+1) - 1)/2).truncate + 1
  p = (8 * r * (r-1)) / 2;
  en = r * 2
  a = (1 + n - p) % (r * 8)
  puts "#{n} #{r} #{p} #{en} #{a}"
  case (a / (r * 2)).truncate
  when 0
    puts "Case 0: #{n}, #{a - r}, #{-r}"
  when 1
    puts "Case 1: #{n}, #{r}, #{(a % en) - r}"
  when 2
    puts "Case 2: #{n}, #{r - (a % en)}, #{r}"
  when 3
    puts "Case 3: #{n}, #{-r}, #{r - (a % en)}"
  else
    puts "cant compute"
  end
end

[*0..(data-1)].each { |x| spiral(x) }
