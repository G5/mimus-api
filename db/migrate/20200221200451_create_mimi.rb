class CreateMimi < ActiveRecord::Migration[6.0]
  def change
    create_table :mimi do |t|
      t.text :content
      t.string :unique_hash

      t.timestamps
    end
  end
end
