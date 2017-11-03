class PrioritiesController < ApplicationController
  before_action :find_strategy, except: [:update]

  def create
    @priority = @strategy.priorities.build(priority_params)
    if @priority.save
      flash[:success] = t(".success")
      redirect_to @strategy
    else
      render :new
    end
  end

  def new
    @priority = @strategy.priorities.build
  end

  def update
    @priority = Priority.find(params[:id])
    if @priority.update(priority_params)
      flash[:success] = I18n.t("forms.priorities.update.success")
    else
      flash[:error] = I18n.t("forms.priorities.update.failure")
    end
    redirect_to :back
  end

  private

  def priority_params
    params.require(:priority).permit(:card_type, :sequence)
  end

  def find_strategy
    @strategy = Strategy.find(params[:strategy_id])
  end
end
