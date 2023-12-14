class CreateYougas < ActiveRecord::Migration[7.0]
  def change
    create_table :yogas do |t|
      t.string :name
      t.text :description
      t.integer :duration
      t.timestamps
    end
  end
end
