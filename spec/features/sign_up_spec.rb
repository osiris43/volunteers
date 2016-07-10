require 'rails_helper'

describe "the signup process", :type => :feature do
  it "signs me up" do
    visit '/users/sign_up'
    within("#new_user") do
      fill_in 'Full Name', :with => 'Brett Bim'
      fill_in 'Email Address', :with => 'user@example.com'
      fill_in 'Password', :with => 'password'
      fill_in 'Password confirmation', :with => 'password'
    end
    click_button 'Create My Account'
    expect(page).to have_content 'Join an Organization'
  end
end
