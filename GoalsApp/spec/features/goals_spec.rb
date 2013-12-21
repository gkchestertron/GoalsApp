require 'spec_helper'

describe "goal features" do
  before(:each) do
    create_category
    create_user
  end

  it "creates a new public goal" do
    create_goal("gain 1000lbs", "doesn't matter", "public")
    expect(page).to have_content "gain 1000lbs"
  end

  it "creates a new private goal" do
    create_goal("gain 1200lbs", "doesn't matter", "private")
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

  it "user can edit a goal" do
    create_goal("not die", "doesn't matter", "public")
    click_link("Edit goal")
    edit_goal("not die", "still doesn't matter", "public", "completed")
    expect(page).to have_content "still doesn't matter"
  end

  it "has a button to complete a goal" do
    create_goal("self esteem", "doesn't matter", "private")
    click_link('Edit goal')
    edit_goal("self esteem", "doesn't matter", "public", "completed")
    expect(page).to have_content "Completed? true"
  end



end