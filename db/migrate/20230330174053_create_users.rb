class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :email
        # password_digest not password column, because encyrpted
      t.string :password_digest
      t.string :real_name
      t.string :username
    end
  end
end
