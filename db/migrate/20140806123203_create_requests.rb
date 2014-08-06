class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.belongs_to :article
      t.belongs_to :user

      t.timestamps
    end
    add_index :requests, :article_id
    add_index :requests, :user_id
  end
end
