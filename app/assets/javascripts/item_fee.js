$(document).on('turbolinks:load', function(){
  var sellPriceInput = '#y-sell-input-main';
  var sellFeeFeild = '#y-sell-fee';
  var sellProfitFeild = '#y-sell-profit';

  $(sellPriceInput).on('keyup', function(){
    var input = $(this).val();
    if (input >= 300 && input <= 9999999){
      var fee = Math.floor(input * 0.1);
      var profit = "¥" + (input - fee).toLocaleString();
      $(sellFeeFeild).html("¥" + fee.toLocaleString());
      $(sellProfitFeild).html(profit);
    } else {
      var fee = '-';
      var profit = '-';
      $(sellFeeFeild).html(fee);
      $(sellProfitFeild).html(profit);
    }
  });
}); 