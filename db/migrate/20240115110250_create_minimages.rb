class CreateMinimages < ActiveRecord::Migration[7.0]
  def change
    create_table :minimages do |t|

      t.timestamps
    end
  end
end
