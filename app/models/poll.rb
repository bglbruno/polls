class Poll < ActiveRecord::Base
  has_many :votes, inverse_of: :poll

  validates_presence_of :title

  default_scope -> { order(created_at: :desc) }

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
