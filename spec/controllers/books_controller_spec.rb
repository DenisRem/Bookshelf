# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  login_admin

  let!(:book) { create(:book) }
  let!(:valid_params) { attributes_for(:book) }
  let(:invalid_params) { { title: ' ' } }

  describe 'GET#index' do
    before { get :index }

    context 'when assigns books and renders template' do
      it { expect(response).to have_http_status(:success) }
      it { expect(assigns(:books)).to eq([book]) }
      it { expect(response).to render_template('index') }
    end
  end

  describe 'GET#show' do
    before do
      get :show, params: { id: book.id }
    end

    it { expect(response).to have_http_status(:success) }
    it { expect(assigns(:book)).to eq(book) }
  end

  describe 'GET#new' do
    before { get :new }

    context 'when returns success and assigns book' do
      it { expect(response).to have_http_status(:success) }
      it { expect(assigns(:book)).to be_a_new(Book) }
    end
  end

  describe 'POST#create' do
    context 'with valid params' do
      before { post :create, params: { book: valid_params } }

      context 'when redirects to the created book' do
        it { expect(response).to have_http_status(:redirect) }
        it { expect(response).to redirect_to(book_path(Book.last)) }
      end
    end

    context 'with invalid params' do
      context 'when do not create a new book' do
        it { expect { subject }.not_to change(Book, :count) }
      end
    end
  end

  describe 'GET#edit' do
    before do
      get :edit, params: { id: book.id }
    end

    it { expect(response).to have_http_status(:success) }
    it { expect(assigns(:book)).to eq(book) }
  end

  describe 'PUT#update' do
    context 'with valid params' do
      before do
        put :update, params: { id: book.id, book: valid_params }
      end

      it { expect(assigns(:book)).to eq(book) }
      it { expect(response).to have_http_status(:redirect) }
      it { expect(response).to redirect_to(book_path(book)) }

      context 'when updates book attributes' do
        before { book.reload }

        it { expect(book.title).to eq(valid_params[:title]) }
        it { expect(book.language).to eq(valid_params[:language]) }
        it { expect(flash[:success]).to be_present }
      end
    end

    context 'with invalid params' do
      subject { put :update, params: { id: book.id, book: invalid_params } }

      before { subject }

      context 'when does not change book' do
        it { expect { subject }.not_to change { book.reload.attributes } }
      end
    end
  end

  describe 'DELETE#destroy' do
    subject { delete :destroy, params: { id: book.id } }

    it { expect { subject }.to change(Book, :count).by(-1) }

    context 'when destroys the book and redirects to index' do
      before { subject }

      it 'destroys respective book' do
        expect(Book).not_to exist(id: book.id)
      end

      it { expect(response).to have_http_status(:redirect) }
      it { expect(response).to redirect_to(books_path) }
      it { expect(flash[:danger]).to be_present }
    end
  end
end
