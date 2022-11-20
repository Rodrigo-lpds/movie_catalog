class Movie < ApplicationRecord
    validates :title, :release_year, presence: true
    validates :title, uniqueness: true
    # validates :release_year, comparison: { less_than:2022 }
    has_many :comments

end
