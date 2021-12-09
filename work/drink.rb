class Drink

  @@drink = { "コーラ": { "price": 120, "stock": 5},
          "水": { "price": 100, "stock": 5},
          "レッドブル": { "price": 200, "stock": 5 }}
  
  def get_drink_stock(select_drink)
    @@drink[select_drink][:stock]
  end

  def set_drink_stock(select_drink)
    @@drink[select_drink][:stock] -= 1
  end 

  def get_drink_price(select_drink)
    @@drink[select_drink][:price]
  end

  def display_drink_list
    @@drink.keys.each do |n|
      stock = get_drink_stock(n)
      n = n.to_s
      puts "#{n}：#{stock}本"
    end
  end

      
  def get_stock_drink_list
    @@drink.keys.select{|n|
      drink = n.to_sym
      @@drink[drink][:stock] > 0
    }.map{|n| n.to_s}
  end



  def check_price(select_drink, total_money)
    if total_money < get_drink_price(select_drink)
      puts "#{get_drink_price(select_drink) - total_money}円分お金が不足しています。お金を投入してください。"
      return false
    else
      return true
    end
  end

  def check_stock(select_drink)
    if get_drink_stock(select_drink) == 0 
      puts "在庫がありません。再度飲み物を選択するか、払い戻しをしてください。"
      return false
    else
      return true
    end
  end
end




