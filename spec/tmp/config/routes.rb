Gui::Application.routes.draw do
  get "/templates/:path.html" => "templates#file", :constraints => { :path => /.+/  }
  get "main/index"
  root to: "main#index"

end
