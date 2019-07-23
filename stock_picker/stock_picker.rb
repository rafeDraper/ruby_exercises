class Stocks
    def self.stock_picker(input)
        result = []
        max_profit = 0
      
        input.each_with_index do |buy_price, buy_index|
          input[buy_index+0..-1].each_with_index do |sell_price, sell_index|
            
           profit = sell_price - buy_price
      
            if profit > max_profit
              max_profit = profit
              result = [buy_index, sell_index + buy_index]
            end 

          end
        end
        result
    end
end
