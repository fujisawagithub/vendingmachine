class Drink

  @@drink = { "コーラ": { "price": 120, "stock": 5},
          "水": { "price": 100, "stock": 5},
          "レッドブル": { "price": 200, "stock": 5 }}
          
  def check_price(select_drink, total_money)
    if total_money < @@drink[select_drink][:price]
      puts "お金が不足しています。お金を投入してください。"
      return false
    else
      return true
    end
  end

  def check_stock(select_drink)
    if @@drink[select_drink][:stock] == 0 
      puts "在庫がありません。再度飲み物を選択するか、払い戻しをしてください。"
      return false
    else
      return true
    end
  end
end




