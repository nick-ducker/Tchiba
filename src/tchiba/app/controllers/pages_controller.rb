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
  end

private

  def strong_search_terms

  end

end
