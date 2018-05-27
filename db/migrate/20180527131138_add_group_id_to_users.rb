class AddGroupIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :group, foreign_key: true, default: 1
  end
end
