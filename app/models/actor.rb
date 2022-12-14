class Actor < ApplicationRecord
  validates :name, :email, :birth_date, presence: true
  validates :email, uniqueness: true

  has_many :casts, dependent: :destroy
  has_many :movies, through: :casts
end
