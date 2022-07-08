class TransactionsController < ApplicationController
  def index
    @category = Group.includes(:entities).order('entities.created_at DESC').find(params[:category_id])
  end

  def new
    @category_id = params['category_id']
    transaction = Entity.new
    respond_to do |format|
      format.html { render :new, locals: { transaction: transaction } }
    end
  end

  def create
    @category_id = params['category_id']
    @transaction = current_user.entities.new(transaction_params)

    respond_to do |format|
      format.html do
        ActiveRecord::Base.transaction do
          @transaction.save!
          @entity_groups = EntityGroup.new(entity_id: @transaction.id, group_id: @category_id)
          @entity_groups.save!
        end
        redirect_to categories_path, flash: { alert: 'Created successfully' }
      rescue ActiveRecord::RecordInvalid
        render :new, locals: { transaction: @transaction }, flash: { alert: 'Error occured' }
      end
    end
  end

  private

  def transaction_params
    params.require(:transaction).permit(:name, :amount)
  end
end
