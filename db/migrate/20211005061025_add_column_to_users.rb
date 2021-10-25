class AddColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string, unique: true
    add_column :users, :like_hack, :text
    add_column :users, :icon, :string
    add_column :users, :admin, :boolean, default: false
  end
end
