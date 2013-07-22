require 'spec_helper'

describe "Static pages" do

  subject { page }
  describe "Get out page" do
    before { visit getout_path }
    it { should have_title('RoR') }
    it { should have_content('Get outta here!!!!') }
    it { should_not have_title('| Get Out') }
  end

  describe "About page" do
    before { visit about_path }
    it { should have_title('RoR') }
    it { should have_content("I'm Batman") }
  end
end
