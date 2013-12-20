require 'spec_helper'

describe "Sign Up Process" do
  before(:each) do
    visit new_user_url
  end

  it "has a sign in page" do
    expect(page).to have_content "Sign Up"
  end

  it "shows username after login" do
    fill_in('username', with: 'gerald')
    fill_in('password', with: 'foobies')
    click_button('Create new user!')
    expect(page).to have_content "gerald"
  end

  it "successfully signs a user out" do
    fill_in('username', with: 'gerald')
    fill_in('password', with: 'foobies')
    click_button('Create new user!')
    click_button('Sign Out')
    expect(page).to have_content "Sign In"
  end

  it "has a sign in link" do
    expect(page).to have_content "Sign In"

  end

end
