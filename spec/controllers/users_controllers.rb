require 'spec_helper'

RSpec.describe UsersController, type: :controller do
  subject(:user) { create(:user, :with_posts) }
  let(:headers) { { 'Accept' => 'application/vnd.api+json' } }

  describe 'GET #index' do
    context 'when invalid' do
      it_behaves_like 'request with error', action: :index
    end

    context 'when valid' do
      before(:each) { expect(response).to have_http_status 200 }

      context 'when no query string is set' do
        subject(:response) do
          get :index
        end

        it 'returns a collection of users' do
        end
      end
    end
  end
end

