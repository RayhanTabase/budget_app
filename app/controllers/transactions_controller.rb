class TransactionsController < ApplicationController
  def index
    @category = Group.includes(:entities).find(params[:category_id])
  end

  def new
    @categories = current_user.groups
    transaction = Entity.new
    respond_to do |format|
      format.html { render :new, locals: { transaction: transaction } }
    end
  end

  def create
    @categories = current_user.groups
    category_params = params["category"]
    @selected_category = category_params["category_id"]
    @transaction = current_user.entities.new(transaction_params)
    
    respond_to do |format|
      format.html do
        begin
          ActiveRecord::Base.transaction do
            @transaction.save!
            @entity_groups = EntityGroup.new(entity_id: @transaction.id, group_id: @selected_category)
            @entity_groups.save!
          end
          redirect_to categories_path, flash: { alert: 'Created successfully' }
        rescue ActiveRecord::RecordInvalid => invalid
          render :new, locals: { transaction: @transaction }, flash: { alert: 'Error occured' }
        end
      end
    end
  end

  private

  def transaction_params
    params.require(:transaction).permit(:category_id, :name, :amount)
  end
end
