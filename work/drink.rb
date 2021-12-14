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

  def able_select_drink_list(slot_money)
    list = get_stock_drink_list.select { |n|
      slot_money >= get_drink_price(n)
    }.map{|n| n.to_s}
    p list
    while true
      puts "欲しい飲み物を選択してください。"
      select_drink = gets.chomp.to_sym
      return select_drink if list.include?(select_drink.to_s)
    end
  end


end
