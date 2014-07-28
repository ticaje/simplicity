class CreateTranslations < ActiveRecord::Migration
  def change
    create_table :translations do |t|
      t.string :link
      t.text :content
      t.integer :user_id
      t.integer :article_id

      t.timestamps
    end
  end
end
