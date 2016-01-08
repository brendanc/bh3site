require "uri"
require "net/http"

class PayController < ApplicationController
	protect_from_forgery except: [:catch]

	# this guy will catch the paypal ipn
	def catch
		  params.permit! # Permit all Paypal input params
		  pp_status = params[:payment_status]
		  payer =  params[:payer_email]
		  txn_id = params[:txn_id]
		  amount = params[:mc_gross]
		  url_code = params[:item_name]
		  
		  txn = Hash["payer" => payer, "txn_id" => txn_id, "amount" => amount, "status" => pp_status, "event" => url_code] 
		  puts txn

		  if validate_ipn(request.raw_post) == false
		  	raise "ipn not validated"
		  end
		  if pp_status == "Completed"

		  	  # update the rego record
		  	  event = SpecialEvent.find_by url_code: url_code
		  	  rego = EventRegistration.find_by payment_email: payer, special_event_id: event.id
		  	  rego.paid = true
		  	  rego.save
		  end
		
		  render :text => params
	end

	# this guy will redirect the user to paypal to get their $$
	def index 
		price = params["price"]
		event_name = params["event_name"]
		return_url = params["return_url"]
		# for paypal IPN we have to use https so we can just use the heroku urls
		notify_url = request.host == "bostonhash.com" ? "https://bh3prod.herokuapp.com/paypal" : "https://bh3demo.herokuapp.com/paypal"
		redirect_to paypal_url(price,event_name,return_url,notify_url)
	end

	def success
	end

 private 
	 def paypal_url(price,event_name,return_url,notify_url)
	    values = {
	        business: "#{Figaro.env.paypal_email}",
	        cmd: "_xclick",
	        upload: 1,
	        return: return_url,
	        amount: price,
	        item_name: event_name,
	        item_number: '1',
	        quantity: '1',
	        rm: '0',
	        cbt: 'Back to Boston Hash House Harriers',
	        notify_url: notify_url
	    }
	    url = "#{Figaro.env.paypal_url}" + values.to_query
	    puts url
	    return url
	  end

	  # take raw ipn and validate it
	  def validate_ipn(raw)
	  	post_data = "cmd=_notify-validate&" + raw
	  	url = URI.parse(Figaro.env.ipn_validate_url)
	  	http = Net::HTTP.new(url.host, url.port)
		http.use_ssl = true

		request = Net::HTTP::Post.new(url.path)
		request.body = post_data

		response = http.request(request)
		body = response.body()
		http_status = response.code

		return http_status == "200" && body == "VERIFIED"
	  end
	  	
	  


end