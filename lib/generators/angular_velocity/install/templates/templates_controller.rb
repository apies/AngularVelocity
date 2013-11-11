class TemplatesController < ApplicationController
  
  ## this is deprecated in rails 4
  #caches_page :file

  def file
    @path = params[:path]
    render :file => "app/assets/javascripts/<%= application_name %>/views/#{@path}" #, :layout => nil
  end
  
end

