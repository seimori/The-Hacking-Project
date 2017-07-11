def by3and5(max)
	sum = 0
	for x in 1...max
		if (x%3==0 || x%5==0)
			sum += x
		end
	end
	puts sum
end
by3and5(1000)