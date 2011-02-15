class CalculatorsController < ApplicationController
  def index
    session[:calculator_step] = session[:calculator_params] = nil
    @calculators = Calculator.all
  end

  def show
    @calculator = Calculator.find(params[:id])
  end

  def new
    session[:calculator_params] ||= {}
    @calculator = Calculator.new(session[:calculator_params])
    @calculator.current_step = session[:calculator_step]
  end

  def create
    session[:calculator_params].deep_merge!(params[:calculator]) if params[:calculator]
    @calculator = Calculator.new(session[:calculator_params])
    @calculator.current_step = session[:calculator_step]
    if @calculator.valid?
      if params[:back_button]
        @calculator.previous_step
      elsif @calculator.last_step?
        @calculator.save
      else
        @calculator.next_step
      end
      session[:calculator_step] = @calculator.current_step
    end
    if @calculator.new_record?
      render :action => 'new'
    else
      session[:calculator_step] = session[:calculator_params] = nil
      flash[:notice] = "Successfully saved calculation."
      redirect_to @calculator
    end
  end

  def edit
    @calculator = Calculator.find(params[:id])
  end

  def update
    @calculator = Calculator.find(params[:id])
    if @calculator.update_attributes(params[:calculator])
      flash[:notice] = "Successfully updated calculation."
      redirect_to calculator_url
    else
      render :action => 'edit'
    end
  end

  def destroy
    @calculator = Calculator.find(params[:id])
    @calculator.destroy
    flash[:notice] = "Successfully destroyed calculator."
    redirect_to calculators_url
  end  
end
