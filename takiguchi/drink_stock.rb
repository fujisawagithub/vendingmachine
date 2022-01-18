require './drink.rb'

class Stock < Drink

  def initialize
    super
    @@stocks = { "コーラ": 5, "水": 5, "レッドブル": 5 }
  end
  

  def get_drink_stock(select_drink)
    @@stocks[select_drink]
  end

  def add_drink_stock(select_drink, num)
    @@stocks[select_drink] += num
  end 

  def subtract_drink_stock(select_drink)
    @@stocks[select_drink] -= 1
  end 

  def get_stock_drink_list
    @@stocks.keys.select{|n|
      drink = n.to_sym
      @@stocks[drink] > 0
    }
  end


  def display_all_drink_list
    @@stocks.keys.each do |n|
      stock = get_drink_stock(n)
      n = n.to_s
      puts "#{n}：#{stock}本"
    end
  end

  def get_full_drinks_info
    @merge_drink_list = {}
    @@prices.each_key{ |key| 
      @merge_drink_list[key] = {}
      @merge_drink_list[key].store(:price, get_drink_price(key))
      @merge_drink_list[key].store(:stock, get_drink_stock(key))
    } 
  end

  def set_purchased_drinks=(select_drink)
    @purchased_drinks = {} if @purchased_drinks.nil?
    if @purchased_drinks.keys.include?(select_drink)
      @purchased_drinks[select_drink][:stock] += 1
    else 
      @purchased_drinks[select_drink] = {}
      @purchased_drinks[select_drink].store(:stock, 1)
    end
  end

  def get_purchased_drinks
    @purchased_drinks
  end
end