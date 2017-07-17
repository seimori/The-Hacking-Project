def cypher(msg, offset)
	msg = msg.downcase
	fullCode = ''
	msg.split('') #msg is converted from string to array
	for i in 0...msg.length
		unit = msg[i].ord #each instance of the msg array is stored in "unit" as an integer
		code = unit + offset
		if (code > 122) #looping from "z" to "a"
			code = 97 - 1 + (code - 122)
		end
		code = code.chr #convert code to a character
		fullCode += code
	end



	puts fullCode	
end
cypher("LuckyNumber", 7)