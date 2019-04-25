class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  accepts_nested_attributes_for :user, reject_if: proc {|attr| attr[:username].empty?}, allow_destroy: true

  def user_attributes=(username)
    self.user = User.find_or_create_by(username)
  end
end
