class ChangeReleaseYearToBeIntegerInMovies < ActiveRecord::Migration[7.0]
  def change
    change_column :movies, :release_year, :integer
  end
end
