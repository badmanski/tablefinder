class UsersController < InheritedResources::Base

  def new
    @roles = User::ROLES
    @places = Place.all.map{|x| [x.name, x.id]}
    new!
  end

  def edit
    @roles = User::ROLES
    @places = Place.all.map{|x| [x.name, x.id]}
    edit!
  end

  def permitted_params
    params.permit(user: [:name, :email, :phone, :role, :password, :password_confirmation, :place_id])
  end
end
