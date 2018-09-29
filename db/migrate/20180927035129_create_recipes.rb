class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string :title, null: false
      t.integer :category, null: false
      t.float :preparation_time, null: false
      t.float :oven_time, null: false
      t.text :ingredients, null: false
      t.text :steps, null: false
      t.string :image
      t.references :user, foreign_key: true, null: false

      t.timestamps
    end
  end
end
