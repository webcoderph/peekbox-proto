class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.string :image_orientation
      t.datetime :date
      t.string :location
      t.text :description
      t.references :user

      t.timestamps
    end
    add_index :events, :user_id
  end
end
