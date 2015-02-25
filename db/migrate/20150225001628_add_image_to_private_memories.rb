class AddImageToPrivateMemories < ActiveRecord::Migration
  def change
    add_column :private_memories, :image, :string
  end
end
