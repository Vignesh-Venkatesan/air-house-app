require 'spec_helper'

describe "MainPages" do
  describe "GET /home" do

    it "go to home and check the ui" do
      visit '/home'

	  expect(page).to have_title('Home')
      expect(page).to have_content('Book unique places to stay and things to do.')
    end

  end
end
