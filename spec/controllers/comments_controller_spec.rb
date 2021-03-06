require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe CommentsController, type: :controller do
  fixtures :users
  fixtures :posts
  # This should return the minimal set of attributes required to create a valid
  # Comment. As you add validations to Comment, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {user_id: 1, post_id: 2, body: 'hello this is a comment.'}
  }

  let(:invalid_attributes) {
    {user_id: 1, post_id: 2}
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # CommentsController. Be sure to keep this updated too.
  let(:valid_session) {
    {'session_token'=> 'K7loJplbDl9hgmnrFGKm9Q'}
  }

  describe "GET #index" do
    it "assigns all comments as @comments" do
      comment = Comment.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:comments)).to eq([comment])
    end
  end

  describe "GET #show" do
    it "assigns the requested comment as @comment" do
      comment = Comment.create! valid_attributes
      get :show, {:id => comment.to_param}, valid_session
      expect(assigns(:comment)).to eq(comment)
    end
  end

  describe "GET #new" do
    it "assigns a new comment as @comment" do
      get :new, {}, valid_session
      expect(assigns(:comment)).to be_a_new(Comment)
    end
  end

  describe "GET #edit" do
    it "assigns the requested comment as @comment" do
      comment = Comment.create! valid_attributes
      get :edit, {:id => comment.to_param}, valid_session
      expect(assigns(:comment)).to eq(comment)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Comment" do
        expect {
          post :create, {:comment => valid_attributes}, valid_session
        }.to change(Comment, :count).by(1)
      end

      it "creates a new Comment without login" do
        expect {
          post :create, {:comment => valid_attributes}
        }.to change(Comment, :count).by(0)
      end

      it "assigns a newly created comment as @comment" do
        post :create, {:comment => valid_attributes}, valid_session
        expect(assigns(:comment)).to be_a(Comment)
        expect(assigns(:comment)).to be_persisted
      end

      it "redirects to the created comment" do
        post :create, {:comment => valid_attributes}, valid_session
        expect(response).to redirect_to(post_url(id: valid_attributes[:post_id]))
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved comment as @comment" do
        post :create, {:comment => invalid_attributes}, valid_session
        expect(assigns(:comment)).to be_a_new(Comment)
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {user_id: 1, post_id: 2, body: 'hello this is a comment2.'}
      }

      it "assigns the requested comment as @comment" do
        comment = Comment.create! valid_attributes
        put :update, {:id => comment.to_param, :comment => valid_attributes}, valid_session
        expect(assigns(:comment)).to eq(comment)
      end

      it "redirects to the comment" do
        comment = Comment.create! valid_attributes
        put :update, {:id => comment.to_param, :comment => valid_attributes}, valid_session
        expect(response).to redirect_to(post_path id: valid_attributes[:post_id])
      end

      it "should fail if not logged in" do
        comment = Comment.create! valid_attributes
        put :update, {:id => comment.to_param, :comment => valid_attributes}
        expect(response).to redirect_to(post_path id: valid_attributes[:post_id])
        expect(flash[:warning]).to be_present
      end
    end

    context "with invalid params" do
      it "assigns the comment as @comment" do
        comment = Comment.create! valid_attributes
        put :update, {:id => comment.to_param, :comment => invalid_attributes}, valid_session
        expect(assigns(:comment)).to eq(comment)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested comment" do
      comment = Comment.create! valid_attributes
      expect {
        delete :destroy, {:id => comment.to_param}, valid_session
      }.to change(Comment, :count).by(-1)
    end

    it "should fail if not logged in" do
      comment = Comment.create! valid_attributes
      expect {
        delete :destroy, {:id => comment.to_param}
      }.to change(Comment, :count).by(0)
    end

    it "redirects to the comments list" do
      comment = Comment.create! valid_attributes
      delete :destroy, {:id => comment.to_param}, valid_session
      expect(response).to redirect_to(post_path(id: comment.post_id))
    end
  end

end
