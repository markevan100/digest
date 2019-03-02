class Category < ActiveRecord::Base
  belongs_to :user
  has_many :discussion_categories
  has_many :discussions, through: :discussion_categories

  # validates :name, presence: true, length: { minimum: 3, maximum: 25 }
  # validates_uniqueness_of :name

end
