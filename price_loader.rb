require "csv"
require_relative "price"

class PriceLoader
  DATA = []
	CSV.foreach('prices.csv') do |row|
    type = row[0]
    price = row[1].to_i
		DATA.push(Price.new(type, price))
	end
   
  def self.find_by_type(type)
    DATA.find { |price| price.type == type }
  end
end
 