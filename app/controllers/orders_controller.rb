#Handles Paypal payments and orders
class OrdersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
  end

  def create_order
    # PAYPAL CREATE ORDER
    price = '20.00'
    request = PayPalCheckoutSdk::Orders::OrdersCreateRequest::new
    request.request_body({
      :intent => 'CAPTURE',
      :purchase_units => [
        {
          :amount => {
            :currency_code => 'USD',
            :value => price
          }
        }
      ]
      })
      begin
        response = @client.execute request
        order = Order.new
        order.price = price.to_i
        order.token = response.result.id
        if order.save
          return render :json => {:token => response.result.id}, :status => :ok
        end
      rescue PayPalHttp::HttpError => ioe
        # HANDLE THE ERROR
      end
    end

    def capture_order
      # PAYPAL CAPTURE ORDER
      request = PayPalCheckoutSdk::Orders::OrdersCaptureRequest::new params[:order_id]
      begin
        response = @client.execute request
        order = Order.find_by :token => params[:order_id]
        order.paid = response.result.status == 'COMPLETED'
        if order.save
          return render :json => {:status => response.result.status}, :status => :ok
        end
      rescue PayPalHttp::HttpError => ioe
        # HANDLE THE ERROR
      end
    end

    private
      def paypal_init
        client_id = 'AVph5pjqoWK3kHoG9EX2lNQ5cKTqZs_bwSTspoqegfUNfE9Z1Hpfc3po3ESK16u6XIIl8oQh7AfSGD3A'
        client_secret = 'EEQEGHHWyDDFjKVoyq1CGm5g-UURlAsMr3DHQIGoGtkzqxbkavMOWJ_WKIcx2qzzS8651hANWe1LRgms'
        environment = PayPal::SandboxEnvironment.new client_id, client_secret
        @client = PayPal::PayPalHttpClient.new environment
      end
end
