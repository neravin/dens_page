class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :name
      t.decimal :price, precision: 8, scale: 2
      t.date :start_date
      t.date :end_date
    end
  end
end
