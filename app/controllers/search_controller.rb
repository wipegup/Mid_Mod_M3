require 'pry'
class SearchController < ApplicationController
  def index
    # binding.pry
    render locals: {facade: SearchInfoFacade.new( params[:q]
      )}
  end
end
