class Comment < ApplicationRecord
  validates :text, presence: true
  belongs_to :movie
end
