require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject { described_class.new(user_id: 1, post_id: 3, text: 'Nice post!') }
  before { subject.save }

  it 'requires user_id to be present' do
    subject.user_id = nil
    expect(subject).to_not be_valid
  end

  it 'requires text to be present' do
    subject.text = nil
    expect(subject).to_not be_valid
  end

  it 'requires post_id to be an integer' do
    subject.post_id = 'a'
    expect(subject).to_not be_valid
  end
end
