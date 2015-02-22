class CreatePrivateMemories < ActiveRecord::Migration
  def change
    create_table :private_memories do |t|
      t.text :body
      t.string :name

      t.timestamps
    end
  end
end
