class User < ApplicationRecord
  has_many :discussions
  has_many :responses
end
