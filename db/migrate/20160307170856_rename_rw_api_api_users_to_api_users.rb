class RenameRwApiApiUsersToApiUsers < ActiveRecord::Migration[5.0]
  def change
    rename_table  :rw_api_api_users, :api_users
    add_reference :api_users,        :user, foreign_key: true, index: { unique: true }
  end
end
