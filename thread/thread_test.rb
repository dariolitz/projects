Thread.new{
	50.times do 
		puts "H"
		sleep(0.5)
	end
}

Thread.new{
	50.times do 
		puts "Hello"
		sleep(0.5)
	end
}

50.times do 
	puts "aa"
	sleep(0.5)
end
