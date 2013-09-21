require 'spec_helper'

describe 'Users' do
  describe 'Visitor' do
    before(:all) do
      Place.destroy_all
      User.destroy_all
      @place = Place.make!
      @user = User.make!
    end

    it 'can visit dashboard, places index and show' do
      visit root_path
      expect(page).to have_content('Welcome, guest!')

      visit places_path
      expect(page).to have_content(@place.name)

      click_link(@place.name)
      expect(page).to have_content(@place.name)
      expect(page).to have_content(@place.email)
      expect(page).to have_content(@place.phone)
      expect(page).to have_content(@place.address)
    end

    it 'can not see logout, and users menu' do
      visit root_path
      expect(page.has_content?('Users')).to be false
      expect(page.has_content?('Logout')).to be false
    end

    it 'can not visit users views' do
      visit users_path
      expect(page).to have_content('Please Log in')

      visit new_user_path
      expect(page).to have_content('Please Log in')

      visit user_path(@user)
      expect(page).to have_content('Please Log in')

      visit edit_user_path(@user)
      expect(page).to have_content('Please Log in')
    end

    it 'can not visit places new and edit views' do
      visit new_place_path
      expect(page).to have_content('Please Log in')

      visit edit_place_path(@place)
      expect(page).to have_content('Please Log in')
    end

  end

  describe 'Place member' do
    before(:all) do
      Place.destroy_all
      User.destroy_all
      @place = Place.make!
      @user = User.make!(place: @place, role: User::ROLE_MEMBER)
    end
    
  end

  describe 'Place owner' do
    
  end

  describe 'Admin' do
    
  end
end
