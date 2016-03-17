class AddTokenExpiresAtToApiUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :rw_api_api_users, :token_expires_at, :datetime
  end
end
