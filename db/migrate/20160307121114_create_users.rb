class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      ## User Info
      t.string :first_name
      t.string :last_name
      t.string :organization
      t.string :email, index: { unique: true }
      ## Database authenticatable
      t.string :password_digest
      ## Activable
      t.boolean :active, default: true, null: false
      t.datetime :deactivated_at

      t.timestamps
    end
  end
end
