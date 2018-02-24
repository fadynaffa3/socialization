class CreateMentions < ActiveRecord::Migration[5.1]
  def change
    create_table :mentions do |t|
      t.string :mentioner_type
      t.integer :mentioner_id

      t.string :mentioned_in_type
      t.integer :mentioned_in_id

      t.string :mentioned_type
      t.integer :mentioned_id

      t.timestamps
    end
  end
end
