class AddRecievedFollowRequestCountToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :recieved_follow_requests_count, :integer
  end
end
