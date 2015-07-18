class CacheVotesCount < ActiveRecord::Migration
  def change
    execute "update polls set votes_count=(select count(*) from votes where poll_id=polls.id)"
  end
end
