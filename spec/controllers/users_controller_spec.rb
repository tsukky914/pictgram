require 'rails_helper'

RSpec.describe UsersController, type: :controller do
    
    describe 'GET #new' do
       before { get :new }
       
       it 'レスポンスコードが200であること' do
           expect(response).to have_http_status(:ok)
       end
       
       it 'newテンプレートをレンダリングすること' do
          expect(response).to render_template :new 
       end
       
       it '新しいuserオブジェクトがビューに渡されること' do
           expect(assigns(:user)).to be_a_new User
       end
    end

    describe 'POST #create' do
        before do
            @referer = 'http://test.host/users/new'
            @request.env['HTTP_REFERER'] = @referer
        end
        
        context '正しいユーザ情報が渡ってきた場合' do
            let(:params)  do
              { user: {
                  name: 'name',
                  email: 'test@test.com',
                  birthday: '1994-09-14',
                  password: 'Password1',
                  password_confirmation: 'Password1',
                #   birthday: '1994/09/14',
                }
              } 
            end
            
            #   it 'ユーザーが1人増えていること' do
            #       expect { post :craete, params: params }.to change(User, :count).by(1)
            #   end
           
            it '投稿一覧にリダイレクトさせること' do
             expect(post :create, params: params).to redirect_to(topics_path)
            end
        end
        
        context 'パラメータに正しいユーザ名、確認パスワードが含まれていない場合' do
            before do
               post(:create, params:{
                   user:{
                       name: '1234567890123456',
                       password: 'Password1',
                       password_confirmation: 'invalid_password',
                   }
               }) 
            end
            
            it 'リファラーにリダイレクトされること' do
                expect(response).to redirect_to(@referer)
            end
            
            # it 'ユーザー名のエラーメッセージが含まれていること' do
            #     expect(flash[:error_messages]).to include 'ログインに失敗しました><'
            # end
            
            # it 'パスワード確認のエラーメッセージが含まれていること'
            
        end
    end
end
