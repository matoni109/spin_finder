class RenameLocationColumnNameToAddress < ActiveRecord::Migration[6.0]
  def change
    rename_column :bikes, :location, :address
  end
end
