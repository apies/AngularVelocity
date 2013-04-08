class TemplatesController < ApplicationController
  
  caches_page :file

  def file
    @path = params[:path]
    render :file => "app/assets/javascripts/<%= application_name %>/views/#{@path}" #, :layout => nil
  end
  
end

