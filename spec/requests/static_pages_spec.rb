require 'spec_helper'

describe "Static pages" do

  describe "Get out page" do
    it "should have the right title" do
      visit '/static_pages/getout'
      expect(page).to have_title('RoR | Get Out')
    end

    it "should have the content 'Get outta here!!!!'" do
      visit '/static_pages/getout'
      expect(page).to have_content('Get outta here!!!!')
    end
  end

  describe "About page" do
    it "should have the right title" do
      visit '/static_pages/about'
      expect(page).to have_title('RoR | About')
    end

    it "should have the content 'I'm Batman'" do
      visit '/static_pages/about'
      expect(page).to have_content("I'm Batman")
    end
  end
end
