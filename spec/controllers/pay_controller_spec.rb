require "spec_helper"

describe PayController do

	describe "GET #index" do
		it "responds successfully with a paypal redirect" do
	      get :index
	      expect(response.status).to eq(302)
	    end

	    it "passes the correct params to paypal" do
	      get :index, {:id => '1', :price => '25.00', :event_name => 'some-hash', :event_id => 100}
	      ppurl = response["Location"]
	      query = Rack::Utils.parse_query URI(ppurl).query
	      
	      expect(response.status).to eq(302)
	      expect(query["amount"]).to eq('25.00')
	      puts query
	      expect(query["item_name"]).to eq('some-hash')
	    end
	end
end