class ApplicationController < ActionController::Base
    
  private
def after_sign_in_path_for(resource_or_scope)
    if resource_or_scope.is_a?(Admin)
        admins_orders_top_path
    else
        root_path
    end
end

def
after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :customer
        root_path
    elsif resource_or_scope == :admin
        new_admin_session_path
    else
        root_path
    end
end
        
end
