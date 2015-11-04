f = File.open("check.txt", "r")
entries = 0

pcs = []

f.lines.each do |line|
	if /^LCKN|lckn|lc|LC/.match(line)
		pcs.push(line.split("	")[0])
	end
end

pcs.each do |pc|
	if pc.split("-")[1] == laptop || LAPTOP
		puts "laptop"
	end
end


puts "#{pcs.length} entries"