class UsersController < InheritedResources::Base

  def permitted_params
    params.permit(user: [:name, :email, :phone, :password, :password_confirmation, :place_id])
  end
end
