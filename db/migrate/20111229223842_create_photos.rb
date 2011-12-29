class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :title
      t.text :description
      t.text :location
      t.album :album_id

      t.timestamps
    end
  end
end
