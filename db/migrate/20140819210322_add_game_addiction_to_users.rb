class AddGameAddictionToUsers < ActiveRecord::Migration
  def change
    add_column :users, :game_addiction, :string
  end
end
