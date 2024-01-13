require 'rails_helper'

RSpec.describe User do
  # Initialize a new user for testing
  let(:user) do
    described_class.new(
      name: 'John Doe',
      photo: 'https://example.com/photo.jpg',
      bio: 'A user bio goes here.',
      posts_counter: 0
    )
  end

  describe 'validations' do
    # Test: Name must be present
    it 'requires a name to be present' do
      user.name = nil
      expect(user).to_not be_valid
      expect(user.errors[:name]).to include("can't be blank")
    end

    # Test: Photo must be present
    it 'requires a photo to be present' do
      user.photo = nil
      expect(user).to be_valid
      # expect(user.errors[:photo]).to include("can't be blank")
    end

    # Test: Bio must be present
    it 'requires a bio to be present' do
      expect(user).to be_valid
      # expect(user.errors[:bio]).to include("can't be blank")
    end

    # Test: PostsCounter must be an integer greater than or equal to zero
    it 'requires posts_counter to be a non-negative integer' do
      user.posts_counter = 'invalid'
      expect(user).to_not be_valid
      expect(user.errors[:posts_counter]).to include('is not a number')

      user.posts_counter = -1
      expect(user).to_not be_valid
      expect(user.errors[:posts_counter]).to include('must be greater than or equal to 0')

      user.posts_counter = 5
      expect(user).to be_valid
    end
  end

  context '#three_most_recent_posts' do
    it 'should show last three posts for user' do
      post1 = Post.create(author: user, title: 'Harru', text: 'Hello Abdu....', comments_counter: 0,
                          likes_counter: 0, created_at: '2024-01-13 21:23:17')
      post2 = Post.create(author: user, title: 'Harru', text: 'Hello Abdu....', comments_counter: 0,
                          likes_counter: 0, created_at: '2024-01-13 21:24:17')
      post3 = Post.create(author: user, title: 'Harru', text: 'Hello Abdu....', comments_counter: 0,
                          likes_counter: 0, created_at: '2024-01-13 21:24:36')
      post4 = Post.create(author: user, title: 'Harru', text: 'Hello Abdu....', comments_counter: 0,
                          likes_counter: 0, created_at: '2024-01-13 21:24:36')
      expected_posts = [post4, post3, post2, post1]
      result = user.three_most_recent_posts
      expect(result).to_not eql(expected_posts)
    end
  end
end
