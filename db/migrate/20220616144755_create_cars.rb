class CreateCars < ActiveRecord::Migration[7.0]
  def change
    create_table :cars do |t|
      t.string :car_model
      t.string :car_type
      t.decimal :price_per_day
      t.string :transmission
      t.text :description
      t.references :user, null: false, foreign_key: true
     
      t.timestamps
    end
  end
end
