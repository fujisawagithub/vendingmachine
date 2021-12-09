class Main

  def initialize
    @total_money = 0
    @sales_amount = 0
    @check_price = false
  end

  def run
    require './drink.rb'
    require './money.rb'
    @drink = Drink.new
    @purchasing = Purchasing.new
    while true
      get_current_status
      ask_anything_want if @select_drink == nil
      # お金挿入
      @answer = "y"
      while @answer == "y" do
        puts "投入出来るお金は[10, 50, 100, 500, 1000]円です。"
        puts "お金を投入してください。"
        @put_money = gets.chomp.to_i
        @total_money = @purchasing.slot_money(@put_money)
        if @total_money == false
          puts "扱えないお金です。"
          puts "投入された#{@put_money}円を返却します。" if @put_money > 0
        end
        puts "------------------------------"
        puts "投入金額：#{@total_money}円" 
        puts "------------------------------"
        puts "再度お金を投入しますか？(y/n)"
        @answer = gets.chomp
      end
      #払い戻し確認
      puts "払い戻しを行いますか？(y/n)"
      @answer = gets.chomp
      if @answer == "y"
        @purchasing.return_money
        break
      end
      # 欲しい飲み物の選択 
      puts "欲しい飲み物を選択してください。"
      
      # stockがあるもののみ表示する (check_stockがいらなくなる)
      # puts "[コーラ, 水, レッドブル]"
      @select_drink = gets.chomp.to_sym
      # 表示された飲み物以外が入力された場合は、再度入力し直す。
      @check_price = @drink.check_price(@select_drink, @total_money)
      next if @check_price == false
      # "売上金額を増やす"
      drink_price = @drink.get_drink_price(select_drink)
      sales_amount = @purchasing.add_sales_amount(drink_price)
      total_money = @purchasing.subtract_slot_money()
      calc_purchase_price = @purchasing.get_current_slot_money - @drink.get_drink_price(select_drink)
      
    end
    puts "ループから抜けました！"
  end


  def ask_anything_want
    while true
      puts "何かお求めですか？(y/n)"
      @answer = gets.chomp
      if @answer == "n"
        puts "ありがとうございました！"
        exit
      elsif @answer != "y"
        puts "(y/n)を入力してください。"
        next
      else break
      end
    end
  end

  def get_current_status
    puts "------------------------------"
    puts "【現在の在庫数】"
    @drink.display_drink_list
    puts "------------------------------"
    puts "投入金額：#{@total_money}円" 
    puts "------------------------------"
    puts "本日の売上高：#{@sales_amount}円"
    puts "------------------------------"
  end

  def get_total_money
    @purchasing.get_current_slot_money
  end





end






