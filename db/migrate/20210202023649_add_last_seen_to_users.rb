class AddLastSeenToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :last_seen, :datetime
  end
end
