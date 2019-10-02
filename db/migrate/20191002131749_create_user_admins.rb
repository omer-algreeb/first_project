class CreateUserAdmins < ActiveRecord::Migration[6.0]
  def change
    create_table :user_admins do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :password_digest
      t.references :job, null: false, foreign_key: true

      t.timestamps
    end
  end
end
