class Log < ApplicationRecord
  validates :approved_date, presence: true
  belongs_to :comment
end
