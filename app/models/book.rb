class Book < ApplicationRecord
  enum status: { returned: 0, rented: 1, deleted: 2 }
  scope :alive, -> { where.not(status: :deleted) }
end
