require 'rails_helper'

feature 'User can create articles' do
  context 'creating message'  
  before do
     create(:user, email: 'odeane@mail.com', password: '123456')
      visit root_path
      click_link ("Sign in")
      fill_in 'Email', :with =>'odeane@mail.com'
      fill_in 'Password', :with => '123456'
      click_on 'Log in'
    end

    it 'expect page to say successfully logged in' do
      expect(page).to have_content 'Signed in successfully.'
    end

    it 'logged in users should see New article option ' do
      expect(page).to have_content 'New Article'
      click_on 'New Article'
      fill_in 'Title', :with => 'Craft blog'
      fill_in 'Content', :with => 'Great place to learn code'
      click_on 'Create Article'
      expect(page).to have_content 'Craft blog'
    end


end

