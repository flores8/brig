class AddImageToMemories < ActiveRecord::Migration
  def change
    add_column :memories, :image, :string
  end
end
