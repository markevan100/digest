class Discussion < ApplicationRecord
  belongs_to :user
  has_many :responses

  validates :title, presence: true, length: { minimum: 3, maximum: 50 }
  validates :question, presence: true, length: { minimum: 10, maximum: 300 }
  validates :user_id, presence: true
end
