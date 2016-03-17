class AddUserAndActiveToWidgets < ActiveRecord::Migration[5.0]
  def change
    add_reference :widgets, :user, index: true, foreign_key: true
    add_column    :widgets, :deactivated_at, :datetime
    add_column    :widgets, :active, :boolean, default: true, null: false
  end
end
