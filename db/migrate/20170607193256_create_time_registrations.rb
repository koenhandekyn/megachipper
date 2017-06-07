class CreateTimeRegistrations < ActiveRecord::Migration[5.1]
  def change
    create_table :time_registrations do |t|
      t.date :prestation_date
      t.integer :work_order_id
      t.integer :employee_id
      t.integer :employee_number
      t.decimal :hours
      t.string :pay_code

      t.timestamps
    end
  end
end
