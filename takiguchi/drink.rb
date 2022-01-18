class Drink

  def initialize  
    @@prices = { "コーラ": 120, "水": 100, "レッドブル": 200 }
  end

  def get_drink_price(select_drink)
    @@prices[select_drink]
  end

  def set_change_drink_price=(select_drink, num)
    @@stocks[select_drink] += num
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
