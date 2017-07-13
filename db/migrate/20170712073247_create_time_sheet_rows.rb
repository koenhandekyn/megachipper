class CreateTimeSheetRows < ActiveRecord::Migration[5.1]
  def change
    create_table :time_sheet_rows do |t|
      t.integer :employee_id
      t.integer :work_order_id
      t.date :date
      t.timestamps
    end
  end
end
