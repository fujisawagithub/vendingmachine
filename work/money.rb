class Money

  MONEY = [10, 50, 100, 500, 1000].freeze

  def initialize
    @slot_money = 0
  end

  # 投入金額の総計を取得できる。
  def get_current_slot_money
    # 自動販売機に入っているお金を表示する
    @slot_money
  end

  # 10円玉、50円玉、100円玉、500円玉、1000円札を１つずつ投入できる。
  # 投入は複数回できる。
  def slot_money(money)
    # 想定外のもの（１円玉や５円玉。千円札以外のお札、そもそもお金じゃないもの（数字以外のもの）など）
    # が投入された場合は、投入金額に加算せず、それをそのまま釣り銭としてユーザに出力する。
    return false unless MONEY.include?(money)
    # 自動販売機にお金を入れる
    @slot_money += money
  end

  def subtract_slot_money(money)
    @slot_money -= money
  end

  # 払い戻し操作を行うと、投入金額の総計を釣り銭として出力する。
  def return_money
    # 返すお金の金額を表示する
    puts "#{@slot_money}円払い戻しました！"
    # 自動販売機に入っているお金を0円に戻す
    @slot_money = 0
  end
end


class  Purchasing < Money
  @sales_amount = 0
  amount = 0
  #balance = amount - price

  def get_sales_amount
    @sales_amount
  end

  def add_sales_amount(price)
    @sales_amount += price
    @slot_money 
  end
end