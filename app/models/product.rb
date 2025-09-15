class Product < ApplicationRecord
  belongs_to :category
  has_one_attached :image

  validates :name, :price_cents, :unit, presence: true
  validates :slug, uniqueness: true

  # Prix en XOF
  def price
    price_cents.to_f / 100
  end

  # Affichage formaté : ex "1 500 XOF / kg"
  def formatted_price
    "#{ActionController::Base.helpers.number_to_currency(price, unit: 'XOF', delimiter: ' ', separator: ',')} / #{unit}"
  end
end
