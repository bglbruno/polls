class Vote < ActiveRecord::Base
  belongs_to :poll

  scope :yes_votes, -> { where( answer: true) }
  scope :no_votes, -> { where( answer: false) }

end
