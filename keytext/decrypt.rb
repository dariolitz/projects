def create_file(char)
	target = File.open("target.txt", "a")
	write_to_file(target, char)
end

def write_to_file(file, line)
	file.print(line)
end

def close_file(file)
	file.close
end

text = File.open("text.txt", "r")
charamount = 0

text.lines.each do |line|
	charamount = charamount + line.length
	line.split("").each do |char|
		char = char.next!
		create_file(char)
	end
end


puts charamount
