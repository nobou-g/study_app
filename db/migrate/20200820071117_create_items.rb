class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :title, null: false
      t.text :discription, null: false
      t.string :price, null: false
      t.binary :image, null: false
      t.references :user, foreign_key: true
      
      t.timestamps
    end
  end
end
