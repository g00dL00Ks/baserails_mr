class AddListingIdToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :listing_id, :integer
    add_column :orders, :integer, :string
  end
end
