class Cheer < ActiveRecord::Base
  attr_accessible :goal_id, :user_id
  validate :user_cheer_counts

  belongs_to :user
  belongs_to :goal

  private

  def user_cheer_counts
    errors.add(:cheer, "No more cheers :( ") if self.user.cheers.count > 9
  end

end
