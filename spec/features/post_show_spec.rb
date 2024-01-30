# spec/features/post_show_spec.rb
require 'rails_helper'

RSpec.feature 'Post Show Page', type: :feature do
  let(:user) { create(:user) }
  let(:post) { create(:post, author: user) }

  scenario 'displays post details' do
    visit user_post_path(user, post)

    expect(page).to have_content(post.title)
    expect(page).to have_text("| Written by: #{user.name}") if user.name.present?
    expect(page).to have_content('Comments: 0') # Assuming no comments initially
    expect(page).to have_content('Likes: 0') # Assuming no likes initially

    # Assuming you have post.text, you may want to update this line accordingly
    expect(page).to have_content(post.text) if post.text.present?
  end

  scenario 'displays number of comments' do
    commentor = create(:user)
    create(:comment, post:, user: commentor)

    visit user_post_path(user, post)

    expect(page).to have_content('Comments: 1')
    expect(page).to have_content("Comment by: #{commentor.name}") if @comment.present?
  end
end
