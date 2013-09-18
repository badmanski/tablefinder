class PlacesController < InheritedResources::Base
  
  def permitted_params
    params.permit(place: [:name, :email, :phone, :url, :address], )
  end
end
