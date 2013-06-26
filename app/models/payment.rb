# app/models/payment.rb 
class Payment < ActiveRecord::Base
  PROCESSING, FAILED, SUCCESS = 1, 2, 3
  
  attr_accessible :stripe_card_token
  
  validates :amount, :stripe_card_token, :presence => true, :numericality => { :greater_than => 0 }

  def purchase
    self.status = PROCESSING
    
    customer = Stripe::Customer.create(description:email, card: stripe_card_token)
    # OPTIONAL: save customer token for further reference
    stripe_customer_token = customer.id
    
    # Charge
    charge = Stripe::Charge.create(
     :amount => amount * 100, # $15.00 this time
     :currency => "usd",
     :customer => stripe_customer_token
    )

    if charge.paid
      self.transaction_num = charge.id
      self.status = SUCCESS
    else
      self.status = FAILED
    end
    return self
  rescue Exception => e
    errors.add :base, "There was a problem with your credit card."
    self.status = FAILED
    return self
  end
end
