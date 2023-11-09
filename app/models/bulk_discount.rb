class BulkDiscount < ApplicationRecord
  belongs_to :merchant

  validates_presence_of :quantity_threshold
  validates_presence_of :percent_discount
end
