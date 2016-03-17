class AddTokenToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :authentication_token, :string
    add_column :users, :token_expires_at,     :datetime
    add_column :users, :last_sign_in_at,      :datetime
    add_column :users, :current_sign_in_at,   :datetime
    add_column :users, :last_sign_in_ip,      :inet
    add_column :users, :current_sign_in_ip,   :inet
    add_column :users, :sign_in_count,        :integer, default: 0, null: false

    add_index :users, :authentication_token, unique: true
  end
end
