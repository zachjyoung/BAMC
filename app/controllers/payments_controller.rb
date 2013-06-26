# app/controllers/payments_controller.rb 

class PaymentsController < ApplicationController
  def create
    @payment = Payment.new(params[:payment])

    if @payment.valid? && @payment.purchase
      flash[:notice] = 'Thanks for Purchase!'
      redirect_to root_url
    else
      render :action => :new
    end
  end
end
