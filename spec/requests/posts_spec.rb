# spec/requests/posts_spec.rb

require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /users/:user_id/posts/index' do
    it 'returns a successful response' do
      user = create(:user) # Assuming you have a user factory
      get "/users/#{user.id}/posts"
      expect(response).to have_http_status(200)
    end

    it 'renders the index template' do
      user = create(:user)
      get "/users/#{user.id}/posts"
      expect(response).to render_template(:index)
    end

    it 'includes correct placeholder text in the response body' do
      user = create(:user)
      get "/users/#{user.id}/posts"
      expect(response.body).to include("User's Posts Goes Here")
    end
  end

  describe 'GET /users/:user_id/posts/:id/show' do
    let(:user) { create(:user) }
    let(:post) { create(:post, author: user) } # Assuming you have a post factory

    it 'returns a successful response' do
      get "/users/#{user.id}/posts/#{post.id}"
      expect(response).to have_http_status(200)
    end

    it 'renders the show template' do
      get "/users/#{user.id}/posts/#{post.id}"
      expect(response).to render_template(:show)
    end

    it 'includes correct placeholder text in the response body' do
      get "/users/#{user.id}/posts/#{post.id}"
      expect(response.body).to include('Here is shown details about each post')
    end
  end
end
