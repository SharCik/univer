class ChangePasswordForStudent < ActiveRecord::Migration
  def change
    remove_column :students, :encrypted_password, :string
    remove_column :students, :reset_password_token, :string
    remove_column :students, :reset_password_sent_at, :string
    add_column :students, :password_digest, :string
  end
end
