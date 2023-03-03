class ExamType < ApplicationRecord
  enum status: {created: 0, approved: 1}
end
