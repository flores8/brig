class AddRelationshipToPrivateMemories < ActiveRecord::Migration
  def change
    add_column :private_memories, :relationship, :string
  end
end
