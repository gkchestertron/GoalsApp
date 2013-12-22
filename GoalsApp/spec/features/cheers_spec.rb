require 'spec_helper'


describe "cheers" do
  before(:each) do
    @user1 = create_user
    @goal1 = create_goal("this my title", "this mah bodeh", "public")
    click_on("Sign Out")
    @user2 = create_user
  end

  it "user should have a cheer button" do
    visit goal_url(@goal1)
    expect(page).to have_button "Cheer this goal"
  end

  it "user should be able to cheer a goal" do
    visit goal_url(@goal1)
    click_on("Cheer this goal")
    expect(page).to have_content "Cheers: 1"
  end

  it "should update cheer numbers" do
    visit goal_url(@goal1)
    click_on("Cheer this goal")
    click_on("Cheer this goal")
    expect(page).to have_content "Cheers: 2"
  end

  it "user should have a maximum of 10 cheers" do
    visit goal_url(@goal1)
    11.times do
      click_on("Cheer this goal")
    end
    expect(page).to have_content "Cheers: 10"
    expect(page).to have_content "No more cheers :( "
  end


end