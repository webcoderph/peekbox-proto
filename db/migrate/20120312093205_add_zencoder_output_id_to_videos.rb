class AddZencoderOutputIdToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :ZencoderOutputId, :string
    add_column :videos, :processed, :boolean
  end
end
