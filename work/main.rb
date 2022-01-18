class Main
  require './drink_stock.rb'
  require './money_purchasing.rb'

  def initialize
    @total_money = 0
    @sales_amount = 0
    @answer = "y"
  end

  def run
    @drink = Stock.new
    @money = Purchasing.new
    puts "いらっしゃいませ！"
    while true
      get_current_status
      branch_route
      break if @close_program == true
      while @answer == "y" do
        puts "投入出来るお金は[10, 50, 100, 500, 1000]円です。"
        puts "お金を投入してください。"
        put_money = gets.chomp.to_i
        @total_money = @money.slot_money(put_money)
        puts "------------------------------"
        puts "投入金額：#{@total_money}円" 
        puts "------------------------------"
        confirm_slot_again_money
      end
      puts "払い戻しを行いますか？(y/n)"
      ask_answer
      if @answer == "y"
        @money.return_money
        break
      end
      able_select_drink_list(@total_money)
      @select_drink = decide_drink
      set_arguments_process
    end
    puts "ありがとうございました！"
  end


  private

  def get_current_status
    puts "------------------------------"
    puts "【現在の在庫数】"
    @drink.display_all_drink_list
    puts "------------------------------"
    puts "投入金額：#{@total_money}円" 
    puts "------------------------------"
    puts "本日の売上高：#{@sales_amount}円"
    puts "------------------------------"
    unless @purchased_drinks.nil?
      puts "【購入済み】"
      @purchased_drinks.keys.each do |n|
        stock = @purchased_drinks[n][:stock]
        n = n.to_s
        puts "#{n}：#{stock}本"
        puts "------------------------------"
      end
    end
  end

  def branch_route
    if @select_drink.nil? || @purchased_drinks != nil
      @close_program = ask_anything_want
      return if @close_program == true
    end
    confirm_slot_again_money unless @purchased_drinks.nil?
  end

  def ask_anything_want
    while true
      puts "何かお求めですか？(y/n)"
      @answer = gets.chomp
      if @answer == "n"
        @money.return_money if @money.get_current_slot_money > 0
        return true
      elsif @answer != "y"
        puts "(y/n)を入力してください。"
      else
        break
      end
    end
  end

  def confirm_slot_again_money
    puts "再度お金を投入しますか？(y/n)"
    ask_answer
  end

  def ask_answer
    while true
      @answer = gets.chomp
      if @answer == "y" || @answer == "n"
        break
      else
        puts "(y/n)を入力してください。"
      end
    end
  end

  def able_select_drink_list(slot_money)
    @list = @drink.get_stock_drink_list.select { |n|
      slot_money >= @drink.get_drink_price(n)
    }.map{|n| n.to_s}
    p @list
  end

  def decide_drink
    while true
      puts "欲しい飲み物を選択してください。"
      select_drink = gets.chomp.to_sym
      return select_drink if @list.include?(select_drink.to_s)
    end
  end

  def set_arguments_process
    select_drink_price = @drink.get_drink_price(@select_drink)
    @sales_amount = @money.set_sales_amount=(select_drink_price)
    @total_money = @money.get_current_slot_money
    @drink.subtract_drink_stock(@select_drink)
    @drink.set_purchased_drinks=(@select_drink)
    @purchased_drinks = @drink.get_purchased_drinks
    puts "#{@select_drink.to_s}が出力されました！"
  end

end