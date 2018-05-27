class CreatePoules < ActiveRecord::Migration[5.2]
  def change
    create_table :poules do |t|
      t.string :name

      t.timestamps
    end
  end
end
