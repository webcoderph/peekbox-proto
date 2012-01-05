class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :title
      t.text :description
      t.references :user

      t.timestamps
    end
    add_column :videos, :category_id, :integer
    add_index :videos, :user_id
  end
end
