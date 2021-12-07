function selectMembershipOption(option, cardID) {
    document.getElementById('item-options').value = option;
    var optionCards = document.getElementsByClassName("membershipOptions");
    for (var i = 0; i < optionCards.length; i++){
        optionCards[i].style.borderWidth = "thin";
    }
    document.getElementById(cardID).style.borderWidth = "3px";
}

/**This code comes from Paypal.com with modifications */
function initPayPalButton() {
    var shipping = 0;
    var itemOptions = document.querySelector("#item-options");
    var quantity = parseInt();
    var quantitySelect = document.querySelector("#quantitySelect");
    if (!isNaN(quantity)) {
    quantitySelect.style.visibility = "visible";
    }
    var orderDescription = '';
    if(orderDescription === '') {
    orderDescription = 'Item';
    }
    paypal.Buttons({
    style: {
        shape: 'rect',
        color: 'gold',
        layout: 'vertical',
        label: 'paypal',
        
    },
    createOrder: function(data, actions) {
        var selectedItemDescription = itemOptions.options[itemOptions.selectedIndex].value;

        // When the user click the paypal button, 
        // send an ajax request with the selected membership plan value
        // to update the user database table
        $.ajax({
            headers: {
                'X-Transaction': 'POST Example',
                'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
            },
            type: 'PUT',
              url: '/payments/update',
              dataType: 'JSON',
              data: { membership: selectedItemDescription },
              success: function(){
                console.log("ajax sent: " + selectedItemDescription);
              }
        });

        var selectedItemPrice = parseFloat(itemOptions.options[itemOptions.selectedIndex].getAttribute("price"));
        var tax = (0 === 0 || false) ? 0 : (selectedItemPrice * (parseFloat(0)/100));
        if(quantitySelect.options.length > 0) {
        quantity = parseInt(quantitySelect.options[quantitySelect.selectedIndex].value);
        } else {
        quantity = 1;
        }

        tax *= quantity;
        tax = Math.round(tax * 100) / 100;
        var priceTotal = quantity * selectedItemPrice + parseFloat(shipping) + tax;
        priceTotal = Math.round(priceTotal * 100) / 100;
        var itemTotalValue = Math.round((selectedItemPrice * quantity) * 100) / 100;

        return actions.order.create({
        purchase_units: [{
            description: orderDescription,
            amount: {
            currency_code: 'USD',
            value: priceTotal,
            breakdown: {
                item_total: {
                currency_code: 'USD',
                value: itemTotalValue,
                },
                shipping: {
                currency_code: 'USD',
                value: shipping,
                },
                tax_total: {
                currency_code: 'USD',
                value: tax,
                }
            }
            },
            items: [{
            name: selectedItemDescription,
            unit_amount: {
                currency_code: 'USD',
                value: selectedItemPrice,
            },
            quantity: quantity
            }]
        }]
        });
    },
    onApprove: function(data, actions) {
        return actions.order.capture().then(function(orderData) {
        
        // Full available details
        console.log('Capture result', orderData, JSON.stringify(orderData, null, 2));

        // Show a success message within this page, e.g.
        const element = document.getElementById('paypal-button-container');
        element.innerHTML = '';
        element.innerHTML = '<h3>Thank you for your payment!</h3>';

        // Or go to another URL:  actions.redirect('thank_you.html');

        });
    },
    onError: function(err) {
        console.log(err);
    },
    }).render('#paypal-button-container');
}
