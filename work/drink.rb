class Drink

  def initialize
    @prices = { "コーラ": 120, "水": 100, "レッドブル": 200 }
  end

  def get_drink_price(select_drink)
    @prices[select_drink]
           end

end
