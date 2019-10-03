require "application_system_test_case"

class ClientSettingsTest < ApplicationSystemTestCase
  test "updating Client settings" do
    # given there is a client with settings
    @vetpost = clients(:vetpost)
    @client_settings = client_settings(:vetpost)
    # and some new distributor
    @amazon = distributors(:amazon)

    visit with_host(client_settings_url, subdomain: @vetpost.subdomain)

    assert_text @client_settings.name
    assert_text @client_settings.distributor.name

    # when I edit client settings
    visit with_host(edit_client_settings_url, subdomain: @vetpost.subdomain)

    select @amazon.name, from: 'Distributor'
    fill_in "Name", with: 'Vetpost'
    click_on "Update Client setting"

    assert_text "Client setting was successfully updated."

    # This will blow up if tenant is not set - nice!
    # ClientSetting.first

    ActsAsTenant.with_tenant(@vetpost) do
      puts count: ClientSetting.count
      assert_equal(ClientSetting.first.name, 'Vetpost')
      assert_equal(ClientSetting.first.distributor, @amazon)
    end
  end
end
