class CreateMemories < ActiveRecord::Migration
  def change
    create_table :memories do |t|
      t.text :post
      t.string :name

      t.timestamps
    end
  end
end
