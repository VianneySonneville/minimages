class AddBase64Rails < ActiveRecord::Migration[7.0]
  def change
    add_column :minimages, :base64, :text, :limit => 4294967295
  end
end
