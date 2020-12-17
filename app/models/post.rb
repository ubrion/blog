class Post < ApplicationRecord
  validates :title, presence: true
  validates :slug, presence: true, uniqueness: true
  validates :body, presence: true
  validates :date, presence: true

  has_many :taggings
  has_many :tags, through: :taggings

  def to_param
    slug
  end
end
