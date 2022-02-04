require 'test_helper'
class LogoutControllerTest < ActionDispatch::IntegrationTest
  setup do
    @administrator = Administrator.new(name: 'Teste', email: 'teste@email.com', password_hash: '123456')
    @administrator.save
  end

  test 'should logout and redirect to login' do
    params = { email: 'teste@email.com', password_hash: '123456' }
    post login_path(params)
    post logout_path
    assert_redirected_to '/login'
  end
end
