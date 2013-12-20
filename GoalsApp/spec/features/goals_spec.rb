require 'spec_helper'

describe "goal features" do
  before(:each) do
    create_user
  end

  it "creates a new public goal" do
    fill_in('title', with: 'gain 1000lbs')
    fill_in('body', with: 'beefy')
    choose('public')
    click_button('Create goal')
    expect(page).to have_content "gain 1000lbs"
  end

  it "creates a new private goal" do
    fill_in('title', with: 'gain 1200lbs')
    fill_in('body', with: 'beefy')
    choose('private')
    click_button('Create goal')
    expect(page).to have_content "gain 1200lbs"
  end

  it "does not see private goals when logged out" do
    click_button('Sign Out')
    visit '/users/1'
    expect(page).not_to have_content "Private goals"
  end

  it "user can create a goal" do
    expect(page).to have_content "Create Goal"
  end

end