class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string :title
      t.string :category
      t.float :preparation_time
      t.float :oven_time
      t.text :ingredients
      t.text :steps
      t.string :image
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
