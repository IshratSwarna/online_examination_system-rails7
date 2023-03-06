class ExamType < ApplicationRecord
  enum status: {created: 0, approved: 1}

  validates :name, presence: true

  scope :ordered, -> { order(id: :desc) }
end
