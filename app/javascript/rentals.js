$(document).on('change', '#rental_hours', function() {
  var prices = [0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100];

  $("select#rental_hours").on("change", function() {
    var hours = parseInt($(this).val());
    var price = prices[hours];

    $("input#rental_price").val(price.toFixed(2));
  });
});