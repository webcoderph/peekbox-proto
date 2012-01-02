class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :title
      t.text :description
      t.references :album

      t.timestamps
    end
    add_index :pictures, :album_id
  end
end
