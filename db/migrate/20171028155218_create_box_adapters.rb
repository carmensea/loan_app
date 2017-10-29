class CreateBoxAdapters < ActiveRecord::Migration[5.1]
  def change
    create_table :box_adapters do |t|

      t.timestamps
    end
  end
end
