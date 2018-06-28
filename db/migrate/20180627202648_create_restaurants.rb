class CreateRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :location
      t.integer :rating
      t.string :price
      t.string :image_url
      t.integer :review_count
      t.string :photos

      t.timestamps
    end
  end
end
