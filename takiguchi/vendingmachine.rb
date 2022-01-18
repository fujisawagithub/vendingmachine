require './drink_stock.rb'
require './money_purchasing.rb'
require './admin_process.rb'
require './customer_process.rb'

class Vendingmachine

def initialize
  @@slot_money = 0
  @@sales_amount = 0
  @@purchased_drinks = nil
end


def run
  @drink = Drink_stock.new
  @money = Money_purchasing.new
  puts "いらっしゃいませ！"
  while true
    get_current_status
    puts "何かお求めですか？(y/n)"
    answer_anything_want = ask_anything_want
    if answer_anything_want = false
      puts "メンテナンスモードを実行しますか？"
      set_answer
      if @ansewer = "y"
        @admin = Admin_process.new
        @admin.run
      else @answer = "n"
        break
      end
    else 
      #available_purchase_drinks = get_stock_drink_list
      unless get_stock_drink_list.blank?
        @customer = Customer_process.new if @@purchased_drinks.nil?
        @customer.run
      else
        puts '現在在庫がないため、購入可能なドリンクがありません'
        break
      end
    end
    puts 'ありがとうございました。'
  end
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

  private

  def get_current_status
    puts "------------------------------"
    puts "【現在の在庫数】"
    @drink.display_drink_list
    puts "------------------------------"
    puts "投入金額：#{@@slot_money}円" 
    puts "------------------------------"
    puts "本日の売上高：#{@@sales_amount}円"
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

  def ask_anything_want
    while true
      puts "何かお求めですか？(y/n)"
      @answer = gets.chomp
      if @answer == "n"
        @money.return_money if @money.get_current_slot_money > 0
        return false
      elsif @answer != "y"
        puts "(y/n)を入力してください。"
      else
        break
      end
    end
  end


