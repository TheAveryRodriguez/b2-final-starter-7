class BulkDiscountsController < ApplicationController
  def index
    @merchant = Merchant.find(params[:merchant_id])
    @bulk_discounts = @merchant.bulk_discounts
  end

  def show
  end

  def new
    @merchant = Merchant.find(params[:merchant_id])
    @bulk_discount = BulkDiscount.new
    render :new
  end

  def create
    @merchant = Merchant.find(params[:merchant_id])
    @bulk_discount = BulkDiscount.new(bulk_discount_params)
    @bulk_discount.merchant = @merchant

    if @bulk_discount.save
      redirect_to merchant_bulk_discounts_path(@merchant)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def bulk_discount_params
    params.require(:bulk_discount).permit(:quantity_threshold, :percent_discount)
  end
end
