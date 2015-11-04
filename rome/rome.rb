input = 1999

m = 0
d = 0
c = 0
l = 0
x = 0
i = 0

m = input.divmod(1000)[0]
input = input.divmod(1000)[1]

d = input.divmod(500)[0]
input = input.divmod(500)[1]

c = input.divmod(100)[0]
input = input.divmod(100)[1]

l = input.divmod(50)[0]
input = input.divmod(50)[1]

x = input.divmod(10)[0]
input = input.divmod(10)[1]

i = input.divmod(1)[0]
input = input.divmod(1)[1]

m.times do
	print "M"
end

d.times do
	print "D"
end

c.times do
	print "C"
end

l.times do
	print "L"
end

x.times do
	print "X"
end

i.times do
	print "I"
end