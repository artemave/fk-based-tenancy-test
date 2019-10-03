class ClientSetting < ApplicationRecord
  acts_as_tenant :client
  belongs_to :distributor, optional: true
end
