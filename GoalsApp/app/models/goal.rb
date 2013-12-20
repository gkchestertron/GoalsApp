class Goal < ActiveRecord::Base
  attr_accessible :body, :completed, :title, :user_id, :private

  validates :title, :user_id, :presence => true


  belongs_to :user
  has_many :cheers

end
