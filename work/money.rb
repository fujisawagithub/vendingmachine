class Money

  MONEY = [10, 50, 100, 500, 1000].freeze
  UNUSED_MONEY = [1, 5, 2000, 5000, 10000].freeze

  def initialize
    @slot_money = 0
  end

  def get_current_slot_money
    @slot_money
  end

  def return_money
    puts "#{@slot_money}円払い戻しました！"
    @slot_money = 0
  end

  def slot_money(money)
    unless MONEY.include?(money)
      puts "扱えないお金です。"
      puts "投入された#{money}円を返却します。" if UNUSED_MONEY.include?(money)
      get_current_slot_money 
    else
      @slot_money += money
    end
  end
end

class  Purchasing < Money

  def initialize
    super
    @sales_amount = 0
  end

  def add_sales_amount(price)
    @slot_money -= price
    @sales_amount += price
  end
end