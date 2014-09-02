class AddDimensionsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :dimensions, :string 
  end
end
