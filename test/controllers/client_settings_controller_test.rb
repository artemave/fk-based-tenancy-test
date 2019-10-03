require 'test_helper'

class ClientSettingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @client_setting = client_settings(:one)
  end

  test "should get index" do
    get client_settings_url
    assert_response :success
  end

  test "should get new" do
    get new_client_setting_url
    assert_response :success
  end

  test "should create client_setting" do
    assert_difference('ClientSetting.count') do
      post client_settings_url, params: { client_setting: { client_id: @client_setting.client_id, distributor_id: @client_setting.distributor_id, name: @client_setting.name } }
    end

    assert_redirected_to client_setting_url(ClientSetting.last)
  end

  test "should show client_setting" do
    get client_setting_url(@client_setting)
    assert_response :success
  end

  test "should get edit" do
    get edit_client_setting_url(@client_setting)
    assert_response :success
  end

  test "should update client_setting" do
    patch client_setting_url(@client_setting), params: { client_setting: { client_id: @client_setting.client_id, distributor_id: @client_setting.distributor_id, name: @client_setting.name } }
    assert_redirected_to client_setting_url(@client_setting)
  end

  test "should destroy client_setting" do
    assert_difference('ClientSetting.count', -1) do
      delete client_setting_url(@client_setting)
    end

    assert_redirected_to client_settings_url
  end
end
