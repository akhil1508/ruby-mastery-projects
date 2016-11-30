def stock_picker stock_prices_array

  stock_prices_array.pop
  greatest = 0
  best_day_to_buy = 0
  best_day_to_sell = 0
  lowest = stock_prices_array[0]
  stock_prices_array.each_with_index do |item, index|
    if item > greatest
      greatest = item
      best_day_to_sell = index
    end
    if item < lowest
      item = lowest
      best_day_to_buy = index
    end
end
best_days_array = [best_day_to_buy, best_day_to_sell]
end

puts "Enter array of stock prices(ordered by day; starting from day zero;) Press enter to send in one day's prices; Enter blank when done"
stock_prices_array =[]
user_input = ' '
while(user_input!='') do
   user_input = gets.chomp
   stock_prices_array << user_input.to_i
end
best_days_array = stock_picker(stock_prices_array)
puts best_days_array.inspect
