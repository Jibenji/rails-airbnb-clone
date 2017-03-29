class RegistrationsController < Devise::RegistrationsController

  def create
    super do
      user = User.create(account_id: resource.id)
    end
  end

  def after_sign_up_path_for(resource)
    profile_path(resource)
  end

end
