class Message < ApplicationRecord
  belongs_to :user
  belongs_to :conversation

  validates :content, presence: true
  validates :content, length: {maximum:1000}
end
