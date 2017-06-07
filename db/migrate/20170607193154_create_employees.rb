class CreateEmployees < ActiveRecord::Migration[5.1]
  def change
    create_table :employees do |t|
      t.integer :number
      t.string :name
      t.json :regime
      t.decimal :hour_rate
      t.decimal :hour_rate_bonus
      t.string :employer_id
      t.string :socsec_id

      t.timestamps
    end
  end
end
