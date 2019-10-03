class ApplicationController < ActionController::Base
  set_current_tenant_by_subdomain(:client, :subdomain)
end
