class House
  attr_reader :price,
              :address,
              :rooms

  def initialize(price, address)
    @price   = price
    @address = address
    @rooms   = []
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

  def rooms_from_category(category)
    @rooms.find_all do |room|
      room.category == category
    end
  end

  def area
    @rooms.sum do |room|
      room.area
    end
  end

  def details
    house_data = {
      "price"   => price,
      "address" => @address
    }
  end

  def price_per_square_foot
    (price.to_f / area.to_f).round(2)
  end

  def rooms_sorted_by_area
    @rooms.sort_by do |room|
      room.area
    end.reverse
  end

  def rooms_by_category
    rooms_by_category = Hash.new(0)
    @rooms.each do |room|
      rooms_by_category[room.category] = 
      rooms_from_category(room.category)
    end
    rooms_by_category
  end
end