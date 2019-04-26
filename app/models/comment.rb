class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  # accepts_nested_attributes_for :user, reject_if: :all_blank

  def user_attributes=(attribute)
    self.user = User.find_or_create_by(username: attribute["username"]) unless attribute["username"].empty?
  end
end
