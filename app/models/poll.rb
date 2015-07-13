class Poll < ActiveRecord::Base
  has_many :votes, inverse_of: :poll

  validates_presence_of :title

  scope :recents, -> { order(created_at: :desc) }
  scope :most_voted, -> { 
    select('polls.*, COUNT(votes.poll_id) as count_votes')
      .joins('LEFT JOIN votes ON votes.poll_id = polls.id')
      .group(:poll_id)
      .order('count_votes DESC')
  }
  scope :last_voted, -> { 
    select('polls.*, MAX(votes.created_at) as last_voted')
      .joins('LEFT JOIN votes ON votes.poll_id = polls.id')
      .group(:poll_id)
      .order('last_voted DESC')
  }

  def votes_size(answer)
    answer == :yes ? votes.yes_votes.size : votes.no_votes.size
  end

  def votes_percent(answer)
    total = votes_size(:yes) + votes_size(:no)
    if total > 0
      (votes_size(answer).to_f * 100.0 / total.to_f).round
    else
      0
    end
  end

end
