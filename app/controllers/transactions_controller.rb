class TransactionsController < ApplicationController
  def index
    @category = Group.find(params[:id])
    @transactions = @category.entities
  end

  def show
    @transaction = Group.find(params[:id])
  end

  def new
    transaction = Group.new
    respond_to do |format|
      format.html { render :new, locals: { transaction: } }
    end
  end
end
