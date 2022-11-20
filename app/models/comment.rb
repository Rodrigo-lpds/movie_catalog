class Comment < ApplicationRecord
  validates :text, presence: true
  belongs_to :movie

  scope :approved_comments, -> { where(status: true) }
end
