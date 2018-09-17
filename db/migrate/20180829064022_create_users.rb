class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.text :self_introduction
      t.text :user_icon

      t.timestamps
    end
  end
end
