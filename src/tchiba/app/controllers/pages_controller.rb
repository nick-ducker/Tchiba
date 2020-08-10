class PagesController < ApplicationController
  before_action :check_for_cart, only: [:home] 

  def home
    #pull 6 random Blends from the database 
    @pagy, @blends = pagy(Blend.order("RANDOM()").limit(6))
  end

  def contact
  end

  def browse
    #pull all the blends for the database and put into pagination gem
    @pagy, @blends = pagy(Blend.all)
  end

  def search
    redirect_to browse_path if search_params.empty?
    property_ids = get_property_ids
    #pull searched blends using controller methods (description below)
    @pagy, @blends = pagy(search_function(search_params[:search], property_ids))
    render 'browse'
  end

private

  def search_params
    params.require(:browse).permit(:search, :tea_ids, :flavour_ids, tea_ids: [], flavour_ids: [])
  end

  def get_property_ids
    property_ids = Array.new
    
    if search_params[:tea_ids].size > 0
      if search_params[:tea_ids].class == String
        property_ids << search_params[:tea_ids].to_i
      else
        search_params[:tea_ids].each{|id| property_ids << id.to_i if id.to_i > 0}
      end 
    end

    if search_params[:flavour_ids].size > 0 
      if search_params[:flavour_ids].class == String
        property_ids << search_params[:flavour_ids].to_i
      else
        search_params[:flavour_ids].each{|id| property_ids << id.to_i if id.to_i > 0}
      end
    end
    return property_ids
  end

  def search_function(search_term, property_ids)
    term = false
    #Decide how to initially filter search results by checking for a search term
    if search_term.length > 0
      #Find blends where the name is LIKE the search term
      blends_relation = Blend.where("blends.name LIKE ?", "%#{search_term}%")
      term = true
      return blends_relation if blends_relation.empty?
    else
      #Find blends that have the first property ID in the property ID array, then delete that ID and check to see if there are still ID's left
      #if not, return the blend collection.
      blends_relation = Blend.joins(:properties).where("properties.id = ?", property_ids[0])
      property_ids.shift
      return blends_relation if blends_relation.empty? || property_ids.empty?
    end
    until property_ids.empty?
      if term
        #queries the db again with the search term and the next property ID if search term is present
        blends_relation = Blend.where("blends.name LIKE ?", "%#{search_term}%").joins(:properties).where("properties.id = ?", property_ids[0])
      else
        #else, queries the db again with just the next property ID
        blends_relation = Blend.joins(:properties).where("properties.id = ?", property_ids[0])   
      end
      #gets rid of the property ID used to query and continues process until the property ID array is empty, then returns final blend collection
      property_ids.shift
      return blends_relation if blends_relation.empty? || property_ids.empty?
    end

    return blends_relation
  end

end
