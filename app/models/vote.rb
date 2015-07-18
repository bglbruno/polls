class Vote < ActiveRecord::Base
  belongs_to :poll, inverse_of: :votes, counter_cache: true

  scope :yes_votes, -> { where( answer: true) }
  scope :no_votes, -> { where( answer: false) }

end
