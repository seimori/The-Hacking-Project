def jean_michel_data(corpus, dico)
	dico_matches = Hash.new(0)
	corpus_list = corpus.split(' ')
  	for i in 0...dico.length
  		for j in 0...corpus_list.length
		  	if (corpus_list[j] == dico[i])
		  		dico_matches[dico[i]] += 1
		  	end
	  	end
  	end
  	puts dico_matches

end




dictionary = ["below", "down", "go", "going", "horn", "how", "howdy", "it", "i", "low", "own", "part", "partner", "sit"]

jean_michel_data("down now go horn down", dictionary)