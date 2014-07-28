class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.integer :article_id
      t.integer :requestype_id

      t.timestamps
    end
  end
end
