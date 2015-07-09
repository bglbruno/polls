class Poll < ActiveRecord::Base
  has_many :votes

  validates_presence_of :title

  def result_yes_votes
    percent_of(votes.yes_votes)
  end

  def result_no_votes
    percent_of(votes.no_votes)
  end

  private
    def percent_of(votes_type)
      if votes_type.size > 0
        (votes_type.size * 100.0 / votes.size).round
      else
        0
      end
    end
end
