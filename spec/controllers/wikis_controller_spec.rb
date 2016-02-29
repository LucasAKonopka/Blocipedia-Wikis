require 'rails_helper'

RSpec.describe WikisController, type: :controller do
  
  describe "GET new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
    
    it "renders #new view" do
      get :new
      expect(response).to render_template :new
    end
    
    it "instantiates @post" do
      get :new
      expect(assigns(:wiki)).not_to be_nil
    end
  end
  
  describe "POST create" do
    it "increases the number of Wiki by 1" do
      expect{post :create, wiki: { title: "new wiki", body: "body of wiki", private: false}}.to change(Wiki,:count).by(1)
    end
  end
end
