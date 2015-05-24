require 'spec_helper'

describe Api::V1::LinksController do

  let(:link) { create :link }

  describe 'GET#index' do
    subject { get :index }

    specify { expect(subject).to be_success }

    context "with category params" do
      let!(:user) { create :user }
      let!(:category_a) { create :category, name: "category A" }
      let(:category_b) { create :category, name: "category B" }
      let!(:link_1) { create :link, category: category_a }
      let!(:link_2) { create :link, category: category_b }
      let(:links_result) do
        [
          {
            id: link_1.id,
            name: link_1.name,
            url: link_1.url,
            created_at: link_1.created_at.to_json.tr('"', ''),
            language: link_1.language,
            category: link_1.category.name,
            category_color: link_1.category.color,
            user: link_1.user.name
          }
        ]
      end

      subject { get :index, category: category_a.name }

      specify { expect(subject).to be_success; }

      specify do
        subject
        binding.pry
        expect(json_response[:links].count).to eql 1
        expect(json_response[:links]).to eql links_result
      end
    end
  end

end