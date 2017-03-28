class RegistrationsController < Devise::RegistrationsController

  def create
    build_resource(sign_up_params)

    user = User.new(user_params)
    user.account = resource
    if resource.valid? && user.valid?
      resource.save
      user.save
      create_end(resource)
    else
      render :new
    end
  end

  def create_end(resource)
    yield resource if block_given?
    if resource.persisted?
      if resource.active_for_authentication?
        set_flash_message! :notice, :signed_up
        sign_up(resource_name, resource)
        respond_with resource, location: after_sign_up_path_for(resource)
      else
        set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end
  end

  def after_sign_up_path_for(resource)
    if resource.user.artist
      edit_user_path(resource.user)
    else
      super
    end
  end

  private

  def user_params
    params_user = params[:account][:user]
    {
      artist: params_user[:artist],
      first_name: params_user[:first_name],
      last_name: params_user[:last_name]
    }
  end

end
