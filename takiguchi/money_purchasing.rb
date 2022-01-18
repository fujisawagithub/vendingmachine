class  Purchasing < Money
  require './drink.rb'

  def initialize
    super
    @sales_amount = 0
  end

  def add_sales_amount(price)
    @slot_money -= price
    @sales_amount += price
  end
end