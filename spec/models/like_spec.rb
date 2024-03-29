# spec/models/like_spec.rb
require 'rails_helper'

RSpec.describe Like, type: :model do
  subject { described_class.new(user_id: 1, post_id: 3) }

  before { subject.save }

  it 'user_id should be present' do
    subject.user_id = nil
    expect(subject).to_not be_valid
  end

  it 'post_id should be an integer' do
    subject.post_id = 'a'
    expect(subject).to_not be_valid
  end
end
