class Poll < ActiveRecord::Base
  has_many :votes, inverse_of: :poll, dependent: :delete_all

  validates_presence_of :title

  scope :recents, -> { order(created_at: :desc) }
  scope :most_voted, -> { 
    select('polls.*, COUNT(votes.poll_id) AS count_votes')
      .joins('LEFT JOIN votes ON votes.poll_id = polls.id')
      .group(:poll_id)
      .order('count_votes DESC')
  }
  scope :last_voted, -> { 
    select('polls.*, MAX(votes.created_at) AS last_voted')
      .joins('LEFT JOIN votes ON votes.poll_id = polls.id')
      .group(:poll_id)
      .order('last_voted DESC')
  }
  scope :no_voted, -> { includes(:votes).where( votes: { id: nil }) }

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

  private
    def total_votes
      votes.size
    end
end
