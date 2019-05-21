class CreateJokes < ActiveRecord::Migration[5.2]
  def change
    create_table :jokes do |t|
      t.integer :joke_id
      t.string :category
      t.string :style
      t.text :setup
      t.text :delivery
      t.text :joke
      t.boolean :nsfw
      t.boolean :political
      t.boolean :religious

      t.timestamps
    end
  end
end
