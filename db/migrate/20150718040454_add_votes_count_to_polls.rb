class AddVotesCountToPolls < ActiveRecord::Migration
  def change
    add_column :polls, :votes_count, :integer, default: 0, null: false
  end
end
