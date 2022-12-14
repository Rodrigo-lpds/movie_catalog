class Comment < ApplicationRecord
  after_update :save_to_logs

  validates :text, presence: true
  belongs_to :movie

  scope :not_approved, -> { where(status: false) }
  scope :approved, -> { where(status: true) }

  has_one :log

  def save_to_logs
    Log.create(approved_date: Time.now.strftime('%d-%m-%Y'), comment_id: id) if log.blank?
  end
end
