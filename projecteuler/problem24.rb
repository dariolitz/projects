class Array
    def swap!(a,b)
         self[a], self[b] = self[b], self[a]
    self
    end
end

array = [0,1,2,3,4,5,6,7,8,9]

l = array.length
i = 0

10.times do 
	array.swap!(l-2,l-1)
	array.swap!(l-3,l-1)
end

# array.insert(l - 2, array.delete_at(l - 1))
# array.insert(l - 3, array.delete_at(l - 1))