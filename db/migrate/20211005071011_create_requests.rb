class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|
      t.string :name, null:false
      t.text :title, null:false

      t.timestamps
    end
  end
end
