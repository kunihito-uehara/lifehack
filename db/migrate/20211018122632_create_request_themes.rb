class CreateRequestThemes < ActiveRecord::Migration[5.2]
  def change
    create_table :request_themes do |t|
      t.string :name
      t.text :title
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
