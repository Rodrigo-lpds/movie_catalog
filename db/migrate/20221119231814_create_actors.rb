class CreateActors < ActiveRecord::Migration[7.0]
  def change
    create_table :actors do |t|
      t.string :name
      t.string :birth_date
      t.string :email

      t.timestamps
    end
  end
end
