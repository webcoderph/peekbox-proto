class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.string :image_type
      t.datetime :event_date
      t.string :location
      t.text :description

      t.timestamps
    end
  end
end
