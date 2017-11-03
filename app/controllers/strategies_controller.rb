class StrategiesController < ApplicationController
  def create
    @strategy = Strategy.new(strategy_params)
    if @strategy.save
      flash[:sucess] = I18n.t("forms.strategies.create.success")
      redirect_to edit_strategy_url @strategy
    else
      render :new
    end
  end

  def edit
    @strategy = Strategy.find(params[:id])
  end

  def index
    @strategies = Strategy.all
  end

  def new
    @strategy = Strategy.new
  end

  def show
    @strategy = Strategy.find(params[:id])
  end

  private

  def strategy_params
    params.require(:strategy).permit(:name)
  end
end
