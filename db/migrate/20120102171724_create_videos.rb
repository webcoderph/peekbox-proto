class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :title
      t.text :description
      t.references :category
      t.references :user

      t.timestamps
    end
    add_index :videos, :category_id
    add_index :videos, :user_id
  end
end
