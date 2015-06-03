require 'spec_helper'

describe Api::V1::SharesController do

  describe 'GET#index' do
    let!(:link) { create :link }
    let!(:tweet) { create :tweet }

    let(:shares_result) do
      [
        {
          id: tweet.id,
          type: "Tweet",
          name: nil,
          url: nil,
          created_at: tweet.created_at.to_json.tr('"', ''),
          language: nil,
          category: nil,
          category_color: nil,
          user: nil,
          remote_id: tweet.remote_id.to_s
        },
        {
          id: link.id,
          type: "Link",
          name: link.name,
          url: link.url,
          created_at: link.created_at.to_json.tr('"', ''),
          language: link.language,
          category: link.category.name,
          category_color: link.category.color,
          user: link.user.name,
          remote_id: nil
        }
      ]
    end

    subject { get :index }

    specify { expect(subject).to be_success }

    specify do
      subject
      expect(json_response[:shares].count).to eql 2
      expect(json_response[:shares]).to eql shares_result
    end

    context "with category params" do

      let!(:category_a) { create :category, name: "category A" }
      let(:category_b) { create :category, name: "category B" }
      let!(:link_1) { create :link, category: category_a }
      let!(:link_2) { create :link, category: category_b }
      let(:shares_result) do
        [
          {
            id: link_1.id,
            type: "Link",
            name: link_1.name,
            url: link_1.url,
            created_at: link_1.created_at.to_json.tr('"', ''),
            language: link_1.language,
            category: link_1.category.name,
            category_color: link_1.category.color,
            user: link_1.user.name,
            remote_id: nil
          }
        ]
      end

      subject { get :index, category: category_a.name }

      specify { expect(subject).to be_success; }

      specify do
        subject
        expect(json_response[:shares].count).to eql 1
        expect(json_response[:shares]).to eql shares_result
      end
    end
  end

end