class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :yoga

  validates :content, presence: true
end
