require 'spec_helper'

describe "Dashboard" do

  describe 'Nobody is logged in' do
    it 'can not access the dashboard' do
      visit dashboard_path
      expect(page).to have_content('Please Log in')
    end
  end

  describe 'Visitor is logged in' do
    before(:all) do
      User.destroy_all
      @user = User.make!
      log_in @user
    end

    after(:all) do
      log_out
    end

    it 'can access the dashboard' do
      visit dashboard_path
      expect(page).to have_content('Welcome, ' + @user.name)
    end
  end

  describe 'Member is logged in' do
    before(:all) do
      User.destroy_all
      Place.destroy_all
      @place = Place.make!
      @user = User.make!(role: User::ROLE_MEMBER, place: @place)
      log_in @user
      visit dashboard_path
    end

    after(:all) do
      log_out
    end

    it 'can access the dashboard' do
      expect(page).to have_content('Welcome, ' + @user.name)
    end

    xit 'can make posts' do
        click_button 'Create Post'
        fill_in 'Title', with: 'The title'
        fill_in 'Content', with: 'The content'
    end
  end
end
