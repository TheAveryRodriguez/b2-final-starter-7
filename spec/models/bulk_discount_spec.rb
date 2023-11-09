require "rails_helper"

describe BulkDiscount, type: :model do
  describe "relationships" do
    it { should belong_to(:merchant) }
  end
  describe "validations" do
    it { should validate_presence_of :quantity_threshold }
    it { should validate_presence_of :percent_discount }
  end
end
