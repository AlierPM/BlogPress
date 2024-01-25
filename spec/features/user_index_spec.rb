require 'rails_helper'
require 'capybara/rspec'

RSpec.feature 'User Index Page', type: :feature do
  let!(:users) { create_list(:user, 3) }

  scenario 'I can see the username of all other users' do
    visit users_path

    users.each do |user|
      expect(page).to have_content(user.name)
    end
  end

  scenario 'I can see the profile picture for each user' do
    visit users_path

    users.each do |user|
      expect(page).to have_selector("img[src*='#{user.photo}']")
    end
  end

  scenario 'I can see the number of posts each user has written' do
    visit users_path

    users.each do |user|
      expect(page).to have_content("Number of posts: #{user.posts.count}")
    end
  end

  scenario 'When I click on a user, I am redirected to that user\'s show page' do
    visit users_path

    user = users.first
    click_link user.name, exact: false

    expect(current_path).to eq(user_path(user))
  end
end
