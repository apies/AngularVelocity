class TemplatesController < ApplicationController
  
  caches_page :file

  def file
    @path = params[:path]
    render :file => "app/assets/javascripts/views/#{@path}" #, :layout => nil
  end
  
end

