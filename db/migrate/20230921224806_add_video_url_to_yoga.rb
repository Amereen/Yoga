class AddVideoUrlToYoga < ActiveRecord::Migration[7.0]
  def change
    add_column :yogas, :video_url, :string
  end
end
