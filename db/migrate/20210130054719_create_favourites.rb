class CreateFavourites < ActiveRecord::Migration[6.0]
  def change
    create_table :favourites do |t|
      # t.references :bike, null: false, foreign_key: true
      # t.references :user, null: false, foreign_key: true
      t.references :favorited, polymorphic: true, index: true
      t.references :user, index: true
      t.timestamps
    end
  end
end
