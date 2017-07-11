def get_file_as_string(filename)
  data = ''
  f = File.open(filename, "r") 
  f.each_line do |line|
    data += line
  end
  return data
end

def get_word_count(text, dico)
	text = get_file_as_string("shakespeare.txt")
	dico_matches = Hash.new(0)
	text_list = text.split(' ')
	for i in 0...dico.length
		for j in 0...text_list.length
			if (text_list[j] == dico[i])
				dico_matches[dico[i]] += 1
			end
		end
	end
	puts dico_matches
end

dictionary = ["the", "of", "and","to", "a", "in", "for", "is", "on", "that", "by", "this", "with", "i", "you", "it", "not", "or", "be", "are"]

get_word_count("the best and the worst", dictionary)