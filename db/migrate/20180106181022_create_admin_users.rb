class CreateAdminUsers < ActiveRecord::Migration[5.1]
  def up

    create_table "admin_users" do |t|
      t.string "username", null: false
      t.string "password_digest", null: false
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end

  end

  def down
    drop_table :admin_users
  end
end
