class AddFirstFpsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_fps, :string
  end
end
