class Main

  require './vendingmachine.rb'
  require './drink.rb'
  require './purchase.rb'
  @money = VendingMachine.new
  @drink = Drink.new
  @purchase = Purchase.new

  check_price = check_stock = false
  
  puts "いらっしゃいませ"

  while true
    # お金挿入
    if check_price == false
      answer = "y"
      while answer == "y" do
        puts "投入出来るお金は[10, 50, 100, 500, 1000]円です。"
        puts "お金を投入してください。"
        insert_money = gets.chomp.to_i
        total_money = @money.slot_money(insert_money)
        puts "現在の投入金額は#{total_money}円です。" 
        puts "再度お金を投入しますか？(y/n)"
        answer = gets.chomp
      end
    end
    #払い戻し確認
    puts "払い戻しを行いますか？(y/n)"
    answer = gets.chomp
    if answer == "y"
      total_money = @money.return_money
      break
    end
    # 欲しい飲み物の選択 
    puts "欲しい飲み物を選択してください。"

    
    # stockがあるもののみ表示する
    puts "[コーラ, 水, レッドブル]"
    select_drink = gets.chomp.to_sym
    check_price = @drink.check_price(select_drink, total_money)
    check_stock = @drink.check_stock(select_drink)
    break if (check_price == true && check_stock == true)
  end
  puts "ループから抜けました！"
  binding.irb
end




