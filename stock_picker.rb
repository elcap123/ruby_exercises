# could loop through every potential combination of stock picks
# E.g. start at index 0 and then check if rest of the array.pop(index).max is > index 0
#   in which case we would save that difference as the current maximum
#   This seems like an easier implementation then figuring out local mins / maxes from the start.
#     Future opportunities to optimize performance like quitting the loop early if no lower priced days exist.
#   I would basically create a nested hash, with the format day# => {profit: $, first_day, last_day}
#   Then at the end 

def stock_picker(day_prices)
  performance_data = {}

  day_prices.each_with_index do |price, index|
    if index == day_prices.length - 1
      next # we could probably use "break" here too since it's the last iteration
    end

    future_days = day_prices[index+1..day_prices.length - 1] # => [3,6,9,15,8,6,1,10] for the first iteration
    
    potential_profit = future_days.max - price
    performance_data[index.to_s] = {
      profit: potential_profit, 
      first_day: index, 
      last_day: future_days.index(future_days.max) + index + 1 # need the +1 because of the effect .pop had.
    }
    
  end
  
  # now that performance_data has been populated, determine which days to return.
  
  potential_profits = performance_data.map { |day, data| data[:profit]}
  max_profit_day = potential_profits.index(potential_profits.max)

  
  performance_data_for_best_day = performance_data[max_profit_day.to_s]
  # output
  [performance_data_for_best_day[:first_day], performance_data_for_best_day[:last_day]]
end




puts stock_picker([17,3,6,9,15,8,6,1,200]) # => output should be [1,4]; for a profit of $15 - $3 == $12

