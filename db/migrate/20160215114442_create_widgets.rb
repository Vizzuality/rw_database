class CreateWidgets < ActiveRecord::Migration[5.0]
  def change
    create_table :widgets do |t|
      t.text :title
      t.text :description
      t.json :data
      t.json :chart
      t.json :layers
      t.text :data_source

      t.timestamps
    end
  end
end
