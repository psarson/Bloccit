require 'rails_helper'

 RSpec.describe Api::V1::PostsController, type: :controller do
   let(:my_user) { create(:user) }
   let(:my_post) { create(:post) }

   context "unauthenticated user" do

     it "PUT update returns http unauthenticated" do
       put :update, id: my_post.id, post: {tile: RandomData.random_sentence, body: RandomData.random_paragraph}
       expect(response).to have_http_status(401)
     end

     it "DELETE destroy returns http unauthenticated" do
       delete :destroy, id: my_post.id
       expect(response).to have_http_status(401)
     end
   end

   context "unauthorized user" do
     before do
       controller.request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Token.encode_credentials(my_user.auth_token)
     end

     it "PUT update returns http forbidden" do
       put :update, id: my_post.id, post: {title: RandomData.random_sentence, body: RandomData.random_paragraph}
       expect(response).to have_http_status(403)
     end

     it "DELETE destroy returns http forbidden" do
       delete :destroy, id: my_post.id, post: {title: RandomData.random_sentence, body: RandomData.random_paragraph}
       expect(response).to have_http_status(403)
     end
   end

   context "authenticated and authorized users" do
     before do
       my_user.admin!
       controller.request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Token.encode_credentials(my_user.auth_token)
       @new_post = build(:post)
     end
   end
 end
