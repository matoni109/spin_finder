class AddCoordinatesToBikes < ActiveRecord::Migration[6.0]
  def change
    add_column :bikes, :latitude, :float
    add_column :bikes, :longitude, :float
  end
end
