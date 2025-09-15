class Category < ApplicationRecord
  has_many :products, dependent: :nullify

  before_validation :generate_slug, on: [:create, :update]

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :slug, presence: true, uniqueness: { case_sensitive: false }

  def to_param
    slug
  end

  private

  def generate_slug
    return if slug.present? && name.present?

    base_slug = name.parameterize
    unique_slug = base_slug
    counter = 2

    while Category.exists?(slug: unique_slug)
      unique_slug = "#{base_slug}-#{counter}"
      counter += 1
    end

    self.slug = unique_slug
  end
end
