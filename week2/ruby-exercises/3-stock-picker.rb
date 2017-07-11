def trader_du_dimanche(prices)
	difference = 0
	buyDay = 0
	sellDay = 0
	for i in 0...prices.length
		subtrahend = prices[i] # 17
		for j in i...prices.length
			minuend = prices[j]
			if (minuend - subtrahend > difference)
				difference = minuend - subtrahend
				buyDay = i
				sellDay = j
			end
		end		
	end
	buyDay += 1 # Converting 0-9 based number to 1-10 based
	sellDay += 1
	puts "Buy day number #{buyDay}"
	puts "Sell day number #{sellDay}"
end

trader_du_dimanche([17,3,6,9,15,8,6,1,10])

def trader_du_lundi(prices)
	best_prices = Hash.new(0)
	test_prices = Hash.new(0)
	for i in 0...prices.length
		prices[i].each do |company, price|
			test_prices["#{company}_buy_price".to_sym] = price
		end
		for j in i...prices.length
			prices[j].each do |company, price|
				if (price - test_prices["#{company}_buy_price".to_sym] > best_prices["#{company}_sell_price".to_sym] - best_prices["#{company}_buy_price".to_sym])
					best_prices["#{company}_buy_price".to_sym] = test_prices["#{company}_buy_price".to_sym]
					best_prices["#{company}_sell_price".to_sym] = price
					best_prices["#{company}_profit".to_sym] = best_prices["#{company}_sell_price".to_sym] - best_prices["#{company}_buy_price".to_sym]
					best_prices["#{company}_sell_day".to_sym] = i + 1
					best_prices["#{company}_buy_day".to_sym] = j + 1
				end
			end
		end
	end
	puts best_prices

end

Lehman_prices = [
	{ :GOO => 15, :MMM => 14, :ADBE => 12, :EA=> 13, :BA => 8, :KO => 10, :XOM => 20, :GPS => 7, :MCD => 11, :DIS => 15, :CRM => 6, :JNJ => 10 },
	{ :GOO => 8, :MMM => 20, :ADBE => 3, :EA=> 10, :BA => 5, :KO => 19, :XOM => 12, :GPS => 6, :MCD => 15, :DIS => 9, :CRM => 10, :JNJ => 17 },
	{ :GOO => 3, :MMM => 8, :ADBE => 15, :EA=> 5, :BA => 10, :KO => 5, :XOM => 15, :GPS => 13, :MCD => 10, :DIS => 18, :CRM => 5, :JNJ => 14 },
	{ :GOO => 17, :MMM => 3, :ADBE => 6, :EA=> 9, :BA => 15, :KO => 6, :XOM => 8, :GPS => 1, :MCD => 10, :DIS => 15, :CRM => 18, :JNJ => 3 },
	{ :GOO => 8, :MMM => 18, :ADBE => 4, :EA=> 6, :BA => 15, :KO => 18, :XOM => 3, :GPS => 12, :MCD => 19, :DIS => 3, :CRM => 7, :JNJ => 9 },
	{ :GOO => 10, :MMM => 12, :ADBE => 8, :EA=> 3, :BA => 18, :KO => 20, :XOM => 5, :GPS => 11, :MCD => 3, :DIS => 9, :CRM => 8, :JNJ => 15 },
	{ :GOO => 17, :MMM => 14, :ADBE => 2, :EA=> 17, :BA => 7, :KO => 13, :XOM => 1, :GPS => 15, :MCD => 15, :DIS => 10, :CRM => 9, :JNJ => 17 }
]

trader_du_lundi(Lehman_prices)