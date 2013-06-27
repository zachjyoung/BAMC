require 'spec_helper'

describe CheckoutController do

  describe "GET 'beats'" do
    it "returns http success" do
      get 'beats'
      response.should be_success
    end
  end

end
