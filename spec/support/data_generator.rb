class DataGenerator
  require_relative "../models/prefecture"
  require_relative "../models/shop"

  def self.generate_all
    generate_prefectures
    generate_shops
  end

  PREFECTURES = [
    [1, :tokyo],
    [2, :osaka],
    [3, :nagoya],
  ]

  def self.generate_prefectures
    PREFECTURES.each do |ident, name|
      Prefecture.create!(id: ident, name: name)
    end
  end

  def self.generate_shops
    Shop.create!(name: "tokyo_shop_a", prefecture_id: 1)
    Shop.create!(name: "tokyo_shop_b", prefecture_id: 1)
    Shop.create!(name: "tokyo_shop_d", prefecture_id: 1)
    Shop.create!(name: "osaka_shop_a", prefecture_id: 2)
  end
end
