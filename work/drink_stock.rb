require './drink.rb'

class Stock < Drink

  def initialize
    super
    @stocks = { "コーラ": 3, "水": 5, "レッドブル": 1 }
  end

  def get_drink_stock(select_drink)
    @stocks[select_drink]
  end

  def subtract_drink_stock(select_drink)
    @stocks[select_drink] -= 1
  end 

  def get_stock_drink_list
    @stocks.keys.select{|n|
      drink = n.to_sym
      @stocks[drink] > 0
    }
  end

  def display_all_drink_list
    @stocks.keys.each do |n|
      stock = get_drink_stock(n)
      n = n.to_s
      puts "#{n}：#{stock}本"
    end
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