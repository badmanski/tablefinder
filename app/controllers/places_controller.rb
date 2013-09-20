class PlacesController < InheritedResources::Base
  skip_before_filter :authorize, only: [:index, :show]
  
  def permitted_params
    params.permit(place: [:name, :email, :phone, :url, :address], )
  end
end
