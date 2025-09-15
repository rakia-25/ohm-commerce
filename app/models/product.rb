class Product < ApplicationRecord
  belongs_to :category
  has_one_attached :image # si ActiveStorage est utilisé

  before_save :generate_slug # garantit que le slug existe avant la sauvegarde

  validates :name, presence: true
  validates :slug, uniqueness: true

  def to_param
    slug
  end

  # Prix formaté (exemple : "500 XOF")
  def formatted_price
    "#{price_cents} XOF"
  end

  private

  def generate_slug
    if self.slug.blank? && self.name.present?
      base_slug = name.parameterize
      unique_slug = base_slug
      counter = 2

      while Product.exists?(slug: unique_slug)
        unique_slug = "#{base_slug}-#{counter}"
        counter += 1
      end

      self.slug = unique_slug
    end
  end
end
