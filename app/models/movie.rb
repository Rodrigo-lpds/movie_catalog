class Movie < ApplicationRecord
  validates :title, :release_year, presence: true
  validates :title, uniqueness: true
  validates :release_year, comparison: { less_than: Time.now.strftime('%Y').to_i, greater_than: 1900 }

  has_many :comments, dependent: :destroy
  has_many :casts, dependent: :destroy
  has_many :actors, through: :casts
end
