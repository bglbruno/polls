class Poll < ActiveRecord::Base
  has_many :votes, inverse_of: :poll

  validates_presence_of :title

  default_scope -> { order(created_at: :desc) }

  def yes_votes
    votes.yes_votes.size
  end

  def no_votes
    votes.no_votes.size
  end

end
