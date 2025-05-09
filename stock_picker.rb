stocks = gets.chomp.split(",").map {|stock| stock.to_i}

def pick_stocks (stocks)
  best_combination = {
    buy_day: 0,
    sell_day: 0,
    profit: 0
  }
  stocks.each_with_index do |stock_buy_price, buy_day|
    stocks.drop(buy_day).each_with_index do |stock_sell_price, sell_day|
      profit = stock_sell_price - stock_buy_price
      if profit >= best_combination[:profit] 
        best_combination[:buy_day] = buy_day
        best_combination[:sell_day] = sell_day + buy_day
        best_combination[:profit] = profit
      end
    end
  end
  return [best_combination[:buy_day], best_combination[:sell_day]]
end

p pick_stocks stocks