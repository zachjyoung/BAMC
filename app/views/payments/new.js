 # app/views/payments/new.js 

var payment;
jQuery(function() {

  Stripe.setPublishableKey($('meta[name="stripe-key"]').attr('content'));
  return payment.setupForm();
});

payment = {

  setupForm: function() {

    $('.head').click(function() {
      $(this).css('disabled', true);

      if($('#payment_stripe_card_token').val()){
        $('#payForm').submit();
      }
      else{
        payment.processCard();
      }
    });
  },

  processCard: function() {

    var card;
    card = {
      number: $('#card_number').val(),
      cvc: $('#card_code').val(),
      expMonth: $('#card_month').val(),
      expYear: $('#card_year').val()
    };
    return Stripe.createToken(card, payment.handleStripeResponse);
  },
  handleStripeResponse: function(status, response) {
    if (status === 200) {
      $('#payment_stripe_card_token').val(response.id)
      $('#stripe_error').remove();
      $('#payForm').submit();
    } else {
      $('#stripe_error').addClass('error').text(response.error.message);
      $('.head').css('disabled', false);
    }
  }
};