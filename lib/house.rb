class House
  attr_reader :price,
              :address,
              :rooms

  def initialize(price, address)
    @price = price
    @address = address
    @rooms = []
  end

  def price
    @price[1..-1].to_i
  end

  def add_room(room)
    @rooms << room
  end

  def above_market_average?
    price > 500_000
  end
end