# spec/features/user_show_spec.rb

require 'rails_helper'

RSpec.describe 'User Show Page', type: :feature do
  before do
    @user = FactoryBot.create(:user)
    create_list(:post, 5, author: @user)
  end

  it 'displays user information' do
    visit user_path(@user)
    expect(page).to have_css("img[src*='#{@user.photo}']")
    expect(page).to have_content(@user.name)
    expect(page).to have_content(@user.bio)
  end

  it 'displays the number of posts the user has written' do
    visit user_path(@user)
    expect(page).to have_content(@user.posts.count)
  end

  it 'redirects to the post\'s show page when a user clicks a post' do
    visit user_path(@user)
    expect(page).to have_content(@user.posts.first.title)
    click_link @user.posts.first.title
    sleep 15
    expect(current_path).to eq(user_post_path(@user, @user.posts.first))
  end

  it 'displays a link to view all posts' do
    visit user_path(@user)
    expect(page).to have_link('See all posts')
  end

  it 'redirects to user post\'s index page when "See all posts" is clicked' do
    visit user_path(@user)
    click_link 'See all posts'
    sleep 15
    expect(current_path).to eq(user_posts_path(@user))
  end
end
