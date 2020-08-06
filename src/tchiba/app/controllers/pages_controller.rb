class PagesController < ApplicationController

  before_action :check_for_cart, only: [:home] 

  def home
  end

  def contact
  end

  def admindashboard
  end

  def browse
  end

  def search
    if search_params.empty?
      redirect_to browse_path
    end

    property_ids = Array.new
    
    if search_params[:tea_ids].size > 0
      search_params[:tea_ids].split.length == 1 ? property_ids << search_params[:tea_ids].to_i : search_params[:tea_ids].each{|id| property_ids << id.to_i}
    end

    if search_params[:flavour_ids].size > 0 
      search_params[:flavour_ids].split.length == 1 ? property_ids << search_params[:flavour_ids].to_i : search_params[:flavour_ids].each{|id| property_ids << id.to_i}
    end

    
    @blends = search_function(search_params[:search], property_ids)

    render 'browse'

  end

private

  def search_params
    params.require(:browse).permit(:search, :tea_ids, :flavour_ids)
  end

  def search_function(search_term, property_ids)
    
    if search_term.length > 0
      blends_relation = Blend.where("blends.name LIKE ?", "%#{search_term}%")
      return blends_relation if blends_relation.empty?
    else
      blends_relation = Blend.joins(:properties).where("properties.id = ?", property_ids[0])
      property_ids.shift
      return blends_relation if blends_relation.empty? || property_ids.empty?
    end

    until property_ids.empty?
      blends_relation = Blend.joins(:properties).where("properties.id = ?", property_ids[0])
      property_ids.shift
      return blends_relation if blends_relation.empty? || property_ids.empty?
    end
  end

end
