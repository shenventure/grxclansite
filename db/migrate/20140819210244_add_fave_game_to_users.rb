class AddFaveGameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :fave_game, :string
  end
end
