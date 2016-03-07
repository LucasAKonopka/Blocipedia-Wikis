require 'rails_helper'

RSpec.describe WikisController, type: :controller do
  my_wiki = Wiki.create!(title: "title" , body: "body")
  
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
  
  describe "PUT update" do
    new_title = "this is a new title"
    new_body = "new descriptions"
    
    it "returns http redirect" do
      put :update, id: my_wiki.id, wiki: {title: new_title, body: new_body}
      expect(response).to redirect_to my_wiki
    end
    
    it "updates the wiki" do
      put :update, id: my_wiki.id, wiki: {title: new_title, body: new_body}
      
      updated_wiki = assigns(:wiki)
      expect(updated_wiki.id).to eq my_wiki.id
      expect(updated_wiki.title).to eq new_title
      expect(updated_wiki.body).to eq new_body
    end
  end
  
  describe "DELETE destroy" do
    it "deletes the wiki" do
      delete :destroy, {id: my_wiki.id}
      
      count = Wiki.where({id: my_wiki.id}).size
      expect(count).to eq 0
    end
    
    it "redirect to wiki index" do
      delete :destroy, {id: my_wiki.id}
      expect(response).to redirect_to wikis_path
    end
  end
end
