require 'spec_helper'

describe Api::V1::SharesController do
  let!(:user) {
    User.create(
      email: 'test@test.com',
      password: '12345678')
  }

  let!(:category) { Category.create(name: 'Agriculture') }

  describe 'POST#create' do
    before { sign_in user }

    subject {
      post :create,
        data: {
          attributes: {
            name: 'something',
            url: 'some URL',
            language: 'FR',
            category: 'Agriculture'
          }
        }
    }
    it { expect(subject).to be_success }

    it do
      subject
      expect(Share.first.name).to eql 'something'
    end

    it do
      subject
      expect(Share.first.url).to eql 'some URL'
    end

    it do
      subject
      expect(Share.first.language).to eql 'FR'
    end

    it do
      subject
      expect(Share.first.category.name).to eql 'Agriculture'
    end
  end

  describe 'GET#index' do
    let!(:link) { create :link, user: user }
    let!(:tweet) { create :tweet }

    let(:shares_result) do
      [
        {
          id: tweet.id.to_s,
          type:"tweets",
          attributes: {
            type: "Tweet",
            name: nil,
            url: nil,
            :'created-at' => tweet.created_at.to_json.tr('"', ''),
            language: nil,
            category: nil,
            :'category-color' => nil,
            user: nil,
            :'remote-id' => tweet.remote_id.to_s
          }
        },
        {
          id: link.id.to_s,
          type: "links",
          attributes: {
            type: "Link",
            name: link.name,
            url: link.url,
            :'created-at' => link.created_at.to_json.tr('"', ''),
            language: link.language,
            category: link.category.name,
            :'category-color' => link.category.color,
            user: link.user.name,
            :'remote-id' => nil
          }
        }
      ]
    end

    subject { get :index }

    specify { expect(subject).to be_success }

    specify do
      subject
      expect(json_response[:data].count).to eql 2
      expect(json_response[:data]).to eql shares_result
    end

    context "with category params" do

      let!(:category_a) { create :category, name: "category A" }
      let(:category_b) { create :category, name: "category B" }
      let!(:link_1) { create :link, user: user, category: category_a }
      let!(:link_2) { create :link, user: user, category: category_b }
      let(:shares_result) do
        [
          {
            id: link_1.id.to_s,
            type: "links",
            attributes: {
              type: "Link",
              name: link_1.name,
              url: link_1.url,
              :'created-at' => link_1.created_at.to_json.tr('"', ''),
              language: link_1.language,
              category: link_1.category.name,
              :'category-color' => link_1.category.color,
              user: link_1.user.name,
              :'remote-id' => nil
            }
          }
        ]
      end

      subject { get :index, category: category_a.name }

      specify { expect(subject).to be_success; }

      specify do
        subject
        expect(json_response[:data].count).to eql 1
        expect(json_response[:data]).to eql shares_result
      end
    end
  end

end
