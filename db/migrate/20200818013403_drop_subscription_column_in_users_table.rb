class DropSubscriptionColumnInUsersTable < ActiveRecord::Migration
  def change
    remove_column :users, :subscription, :string
  end
end
