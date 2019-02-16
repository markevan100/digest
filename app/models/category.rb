class Category < ActiveRecord::Base
  belongs_to :user
  
  validates :name, presence: true, length: { minimum: 3, maximum: 25 }
  validates_uniqueness_of :name

end
