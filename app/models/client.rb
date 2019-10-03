class Client < ApplicationRecord
  after_create do
    ActsAsTenant.with_tenant(self) do
      ClientSetting.create!
    end
  end
end
