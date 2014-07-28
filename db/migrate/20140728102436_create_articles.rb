class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :name
      t.string :link
      t.text :content
      t.integer :category_id
      t.boolean :state

      t.timestamps
    end
  end
end
