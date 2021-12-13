class Drink

  def initialize  
    @drink = { "コーラ": { "price": 120, "stock": 5 },
            "水": { "price": 100, "stock": 5},
            "レッドブル": { "price": 200, "stock": 5 }}
  end

  def get_drink_stock(select_drink)
    @drink[select_drink][:stock]
  end

  def set_drink_stock=(select_drink)
    @drink[select_drink][:stock] -= 1
  end 

  def get_drink_price(select_drink)
    @drink[select_drink][:price]
  end

  def display_drink_list
    @drink.keys.each do |n|
      stock = get_drink_stock(n)
      n = n.to_s
      puts "#{n}：#{stock}本"
    end
  end
  
  def get_stock_drink_list
    @drink.keys.select{|n|
      drink = n.to_sym
      @drink[drink][:stock] > 0
    }
  end
end
