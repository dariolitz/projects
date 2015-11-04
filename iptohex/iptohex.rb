hexlist = ["0","1","2","3","4","5","6","7","8","9","A","B","C","D","E","F"]


input = "192.168.178.1"

first = input.split(".")[0].to_i
second = input.split(".")[1].to_i
third = input.split(".")[2].to_i
fourth = input.split(".")[3].to_i

hexfirst =  hexlist[first / 16] + (first % 16).to_s
hexsecond =  hexlist[second / 16] + (second % 16).to_s
hexthird =  hexlist[third / 16] + (third % 16).to_s
hexfourth =  hexlist[fourth / 16] + (fourth % 16).to_s

puts "#{hexfirst}.#{hexsecond}.#{hexthird}.#{hexfourth}"
