class Task < ApplicationRecord
  belongs_to :user
  belongs_to :status

  validates :user, :status, presence: true
end
