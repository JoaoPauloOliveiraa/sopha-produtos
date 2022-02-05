require 'test_helper'

class LoginControllerTest < ActionDispatch::IntegrationTest
  setup do
    @administrator = Administrator.new(name: 'Teste', email: 'teste@email.com', password_hash: '123456')
    @administrator.save
  end

  test 'should login and redirect to products' do
    params = { email: 'teste@email.com', password_hash: '123456' }
    post login_path(params)
    assert_redirected_to '/products'
    email = JSON.parse(cookies[:crud_sopha])
    assert params[:email], email['email']
  end

  test 'should redirect to login' do
    params = { email: 'teste@email.com', password_hash: '123' }
    post login_path(params)
    assert_redirected_to '/'
  end
end
