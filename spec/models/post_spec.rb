# Unit rspec test for methods and validations in Post model

require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { described_class.new(author_id: 1, text: 'Nice post!') }
  before { subject.save }

  it 'author_id should be present' do
    subject.author_id = nil
    expect(subject).to_not be_valid
  end

  it 'text should be present' do
    subject.text = nil
    expect(subject).to_not be_valid
  end

  it 'text should be at least 3 characters' do
    subject.text = 'a'
    expect(subject).to_not be_valid
  end

  it 'text should be at most 250 characters' do
    subject.text = 'a' * 251
    expect(subject).to_not be_valid
  end

  it 'comments_counter should be an integer' do
    subject.comments_counter = 'a'
    expect(subject).to_not be_valid
  end

  it 'likes_counter should be an integer' do
    subject.likes_counter = 'a'
    expect(subject).to_not be_valid
  end

  it 'comments_counter should be greater than or equal to 0' do
    subject.comments_counter = -1
    expect(subject).to_not be_valid
  end

  it 'likes_counter should be greater than or equal to 0' do
    subject.likes_counter = -1
    expect(subject).to_not be_valid
  end

  it 'should have many comments' do
    assc = described_class.reflect_on_association(:comments)
    expect(assc.macro).to eq :has_many
  end

  it 'should have many likes' do
    assc = described_class.reflect_on_association(:likes)
    expect(assc.macro).to eq :has_many
  end

  it 'should belong to author' do
    assc = described_class.reflect_on_association(:author)
    expect(assc.macro).to eq :belongs_to
  end
end
