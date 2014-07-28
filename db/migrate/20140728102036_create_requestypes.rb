class CreateRequestypes < ActiveRecord::Migration
  def change
    create_table :requestypes do |t|
      t.string :name

      t.timestamps
    end
  end
end
