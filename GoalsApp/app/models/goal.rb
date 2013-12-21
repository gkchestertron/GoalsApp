class Goal < ActiveRecord::Base
  attr_accessible :body, :completed, :title, :user_id, :private, :category_id

  validates :title, :user_id, :presence => true

  belongs_to :category
  belongs_to :user
  has_many :cheers

end
