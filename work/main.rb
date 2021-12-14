class Main
  require './drink.rb'
  require './money.rb'


  def initialize
    @total_money = 0
    @sales_amount = 0
    @check_price = false
    @answer = "y"
  end

  def run
    @drink = Drink.new
    @purchasing = Purchasing.new
    puts "いらっしゃいませ！"
    while true
      get_current_status
      branch_route
      break if @close_program == true
      while @answer == "y" do
        puts "投入出来るお金は[10, 50, 100, 500, 1000]円です。"
        puts "お金を投入してください。"
        put_money = gets.chomp.to_i
        @total_money = @purchasing.slot_money(put_money)
        puts "------------------------------"
        puts "投入金額：#{@total_money}円" 
        puts "------------------------------"
        confirm_slot_again_money
      end
      puts "払い戻しを行いますか？(y/n)"
      ask_answer
      if @answer == "y"
        @purchasing.return_money
        break
      end
      @select_drink = @drink.able_select_drink_list(@total_money)
      set_arguments_process
    end
    puts "ありがとうございました！"
  end


  private

  def get_current_status
    puts "------------------------------"
    puts "【現在の在庫数】"
    @drink.display_drink_list
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
        @purchasing.return_money if @purchasing.get_current_slot_money > 0
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

  def set_arguments_process
    select_drink_price = @drink.get_drink_price(@select_drink)
    @sales_amount = @purchasing.set_sales_amount=(select_drink_price)
    @total_money = @purchasing.get_current_slot_money
    @drink.set_drink_stock=(@select_drink)
    @drink.set_purchased_drinks=(@select_drink)
    @purchased_drinks = @drink.get_purchased_drinks
    puts "#{@select_drink.to_s}が出力されました！"
  end

end