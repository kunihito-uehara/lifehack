class CreateRequestThemes < ActiveRecord::Migration[5.2]
  def change
    create_table :request_themes do |t|
      t.string :name, null:false
      t.text :title, null:false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
