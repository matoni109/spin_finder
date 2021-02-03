class AddTimesBookedToBikes < ActiveRecord::Migration[6.0]
  def change
    add_column :bikes, :times_booked, :integer, default: 0
  end
end
