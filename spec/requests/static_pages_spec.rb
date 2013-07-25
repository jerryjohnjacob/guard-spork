require 'spec_helper'

describe "Static pages" do

  subject { page }
  describe "Get out page" do
    before { visit getout_path }
    it { should have_title('RoR') }
    it { should have_content('Get outta here!!!!') }
    it { should_not have_title('| Get Out') }

    describe "for signed-in users" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        FactoryGirl.create(:micropost, user: user, content: "Lorem ipsum")
        FactoryGirl.create(:micropost, user: user, content: "Dolor sit amet")
        sign_in user
        visit getout_path
      end

      it "should render the user's feed" do
        user.feed.each do |item|
          expect(page).to have_selector("li##{item.id}", text: item.content)
        end
      end

      describe "follower/following counts" do
        let(:other_user) { FactoryGirl.create(:user) }
        before do
          other_user.follow!(user)
          visit getout_path
        end

        it { should have_link("0 following", href: following_user_path(user)) }
        it { should have_link("1 followers", href: followers_user_path(user)) }
      end
    end

  end

  describe "About page" do
    before { visit about_path }
    it { should have_title('RoR') }
    it { should have_content("I'm Batman") }
  end
end
