class Discussion < ApplicationRecord
  belongs_to :user
  has_many :responses
  has_many :discussion_categories
  has_many :categories, through: :discussion_categories

  validates :title, presence: true, length: { minimum: 3, maximum: 50 }
  validates :question, presence: true, length: { minimum: 10, maximum: 300 }
  validates :user_id, presence: true
end
