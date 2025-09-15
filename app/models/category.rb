class Category < ApplicationRecord
    # Une catégorie a plusieurs produits
  has_many :products, dependent: :destroy

  # Validations
  validates :name, presence: true, uniqueness: true
  validates :slug, presence: true, uniqueness: true

  # Méthode pratique pour l'URL
  def to_param
    slug
  end
end
