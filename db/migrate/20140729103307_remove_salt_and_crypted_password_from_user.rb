class RemoveSaltAndCryptedPasswordFromUser < ActiveRecord::Migration
  def up
    remove_column :users, :salt
    remove_column :users, :crypted_password
  end

  def down
    add_column :users, :crypted_password, :string
    add_column :users, :salt, :string
  end
end
