# spec/features/user_post_index_spec.rb
require 'rails_helper'

RSpec.describe 'User post index page', type: :feature do
  before do
    @user = create(:user)
    @posts = create_list(:post, 10, author: @user)
  end

  it 'displays user information' do
    visit user_posts_path(@user)

    expect(page).to have_css("img[src*='#{@user.photo}']")
    expect(page).to have_content(@user.name)
    expect(page).to have_content("Number of posts: #{Post.count}")
  end

  it 'displays each post with title, body, comments, likes' do
    visit user_posts_path(@user)

    @posts.each do |post|
      expect(page).to have_content(/#{Regexp.escape(post.title)}/) if post.text.present?
      expect(page).to have_content(post.text) if post.text.present?
      expect(page).to have_content("Comments: #{post.comments_counter}")
      expect(page).to have_content("Likes: #{post.likes_counter}")
    end
  end

  it 'displays the first comments on a post' do
    visit user_posts_path(@user)

    @posts.each do |post|
      post.comments.limit(3).each do |comment|
        expect(page).to have_content(comment.body)
      end
    end
  end

  it 'displays pagination if there are more posts' do
    # Assuming there are more than 10 posts in the database
    create_list(:post, 15, author: @user)

    visit user_posts_path(@user)

    # Ensure pagination is displayed
    expect(page).to have_selector('.pagination')
  end

  it 'redirects to post show page when clicking on a post' do
    visit user_posts_path(@user)

    # Click the first post's title
    click_link @posts.first.title

    expect(current_path).to eq(user_post_path(@user, @posts.first))
  end
end
