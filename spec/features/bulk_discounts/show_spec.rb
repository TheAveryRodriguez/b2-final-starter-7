require "rails_helper"

RSpec.describe "merchant bulk discount" do
  before :each do
    @merchant1 = Merchant.create!(name: "Hair Care")

    @customer_1 = Customer.create!(first_name: "Naruto", last_name: "Uzumaki")
    @customer_2 = Customer.create!(first_name: "Sasuke", last_name: "Uchiha")
    @customer_3 = Customer.create!(first_name: "Sakura", last_name: "Uchiha")
    @customer_4 = Customer.create!(first_name: "Kakashi", last_name: "Hitake")
    @customer_5 = Customer.create!(first_name: "Shikimaru", last_name: "Nara")
    @customer_6 = Customer.create!(first_name: "Minato", last_name: "Uzumaki")
    @customer_7 = Customer.create!(first_name: "Hashirama", last_name: "Senju")

    @invoice_1 = Invoice.create!(customer_id: @customer_1.id, status: 2)
    @invoice_2 = Invoice.create!(customer_id: @customer_1.id, status: 2)
    @invoice_3 = Invoice.create!(customer_id: @customer_2.id, status: 2)
    @invoice_4 = Invoice.create!(customer_id: @customer_3.id, status: 2)
    @invoice_5 = Invoice.create!(customer_id: @customer_4.id, status: 2)
    @invoice_6 = Invoice.create!(customer_id: @customer_5.id, status: 2)
    @invoice_7 = Invoice.create!(customer_id: @customer_6.id, status: 1)
    @invoice_8 = Invoice.create!(customer_id: @customer_7.id, status: 1)

    @item_1 = Item.create!(name: "Summining Toad", description: "Super strong freak frogs", unit_price: 10, merchant_id: @merchant1.id)
    @item_2 = Item.create!(name: "Sharingan", description: "This makes your eyes bleed", unit_price: 7, merchant_id: @merchant1.id)
    @item_3 = Item.create!(name: "Rasengan", description: "A rotating sphere of chakra", unit_price: 3, merchant_id: @merchant1.id)
    @item_4 = Item.create!(name: "Lighter", description: "1 time use, throw into pit", unit_price: 1, merchant_id: @merchant1.id)

    @ii_1 = InvoiceItem.create!(invoice_id: @invoice_1.id, item_id: @item_1.id, quantity: 1, unit_price: 10, status: 0)
    @ii_2 = InvoiceItem.create!(invoice_id: @invoice_1.id, item_id: @item_2.id, quantity: 1, unit_price: 8, status: 0)
    @ii_3 = InvoiceItem.create!(invoice_id: @invoice_2.id, item_id: @item_3.id, quantity: 1, unit_price: 5, status: 2)
    @ii_4 = InvoiceItem.create!(invoice_id: @invoice_3.id, item_id: @item_4.id, quantity: 1, unit_price: 5, status: 1)
    @ii_5 = InvoiceItem.create!(invoice_id: @invoice_4.id, item_id: @item_4.id, quantity: 1, unit_price: 5, status: 1)
    @ii_6 = InvoiceItem.create!(invoice_id: @invoice_5.id, item_id: @item_4.id, quantity: 1, unit_price: 5, status: 1)
    @ii_7 = InvoiceItem.create!(invoice_id: @invoice_6.id, item_id: @item_4.id, quantity: 1, unit_price: 5, status: 1)

    @transaction1 = Transaction.create!(credit_card_number: 203542, result: 1, invoice_id: @invoice_1.id)
    @transaction2 = Transaction.create!(credit_card_number: 230108, result: 1, invoice_id: @invoice_2.id)
    @transaction3 = Transaction.create!(credit_card_number: 894092, result: 1, invoice_id: @invoice_3.id)
    @transaction4 = Transaction.create!(credit_card_number: 300429, result: 1, invoice_id: @invoice_4.id)
    @transaction5 = Transaction.create!(credit_card_number: 938102, result: 1, invoice_id: @invoice_5.id)
    @transaction6 = Transaction.create!(credit_card_number: 798799, result: 1, invoice_id: @invoice_6.id)
    @transaction7 = Transaction.create!(credit_card_number: 394202, result: 1, invoice_id: @invoice_7.id)

    @bulk_discount_1 = BulkDiscount.create!(quantity_threshold: 7, percent_discount: 21, merchant_id: @merchant1.id)
    @bulk_discount_2 = BulkDiscount.create!(quantity_threshold: 14, percent_discount: 28, merchant_id: @merchant1.id)

    visit merchant_bulk_discount_path(@merchant1, @bulk_discount_1)
  end

  describe "US 4 - Bulk Discount Show" do
    describe "When I visit my bulk discount show page" do
      it "I see the bulk discount's quantity threshold and percentage discount" do
        save_and_open_page

        expect(page).to have_content(@bulk_discount_1.quantity_threshold)
        expect(page).to have_content(@bulk_discount_1.percent_discount)
      end
    end
  end
end
