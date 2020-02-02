

class AddRatingToRestaurants < ActiveRecord::Migration[5.1]
  def change
    # syntax:   :table_name, :column_name, :column_type, :options {}
    # add_column(table_name, column_name, column_type, options = {})
    add_column :restaurants, :rating, :integer, default: 0, null: false
  end
end
