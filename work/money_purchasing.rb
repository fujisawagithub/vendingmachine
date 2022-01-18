require './money.rb'
class  Purchasing < Money

  def initialize
    super
    @sales_amount = 0
  end

  def set_sales_amount=(price)
    @slot_money -= price
    @sales_amount += price
  end
  
end