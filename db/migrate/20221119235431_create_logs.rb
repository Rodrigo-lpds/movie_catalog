class CreateLogs < ActiveRecord::Migration[7.0]
  def change
    create_table :logs do |t|
      t.string :approved_date
      t.references :comment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
