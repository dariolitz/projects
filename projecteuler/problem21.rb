def get_names
	f = File.open("p022_names.txt")
	names = []
	f.each do |content|
		content.delete! "\""
		names = content.split(",")
	end
	return names
end

names = get_names
names.sort!

def split_names(names)
	splitted_names = []

	names.each do |name|
		splitted_names << name.split("")
	end
	return splitted_names
end

name_sums = Hash.new

split_names(names).each do |name|
	name_sum = 0
	name.each do |letter|
		name_sum = name_sum + (letter.ord - 64)
	end
	puts "#{name}"
	name_sums[name] = name_sum
end

hash_index = 1
result = 0
name_sums.each do |name, sum|
	puts hash_index
	result = result + (hash_index * sum)
	hash_index += 1
end

puts result