class CreateRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :yelp_id
      t.string :location
      t.integer :rating
      t.string :price
      t.string :image_url
      t.integer :review_count
      t.string :photos
      t.decimal :longitude
      t.decimal :latitude
      t.string :reviews

      t.timestamps
    end
  end
end
