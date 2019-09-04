require 'spec_helper'

describe HousesController, :type => :controller  do

  	describe "#search" do

    	it "should search for house and display the list" do

    	  	post :search, :house => {
									city: 'Chennai',
									housetype: 'Flat',
								}, :format => 'html'

          puts ""
          puts response.to_a
          puts response.body

          expect(response).to render_template(:search)
          # expect(page).to have_title('Search Result List')
          # response.body.should =~ /Air-Houses Available/
      		# expect(response.body).to include("TNCHN002")
    	end

  	end
end
