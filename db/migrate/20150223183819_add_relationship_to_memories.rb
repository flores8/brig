class AddRelationshipToMemories < ActiveRecord::Migration
  def change
    add_column :memories, :relationship, :string
  end
end
