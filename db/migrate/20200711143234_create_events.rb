class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|

      t.string :title, null: false
      t.text :discription, null: false
      t.text :image, null: false
      t.string :place, null: false
      t.string :date, null: false
      t.references :user, foreign_key: true

      t.timestamps

    end
  end
end
