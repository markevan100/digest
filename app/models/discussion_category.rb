class DiscussionCategory < ApplicationRecord

  belongs_to :discussion
  belongs_to :category

end
