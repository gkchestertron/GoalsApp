require 'spec_helper'

describe 'Categories' do
  before(:each) do
    create_category
    create_user
    create_goal('run 26.1 miles', 'almost there', 'public')
  end

  it "has a name" do
    visit '/categories/1'
    expect(page).to have_content "main"
  end

  it "displays cheer counts" do

  end

end