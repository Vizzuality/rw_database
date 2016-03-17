class CreateRwApiUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :rw_api_api_users do |t|
      t.string :name
      t.string :email
      t.string :api_key, unique: true

      t.timestamps
    end
  end
end
