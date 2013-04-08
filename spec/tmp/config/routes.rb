Gui::Application.routes.draw do
  mount JasmineRails::Engine => "/specs" unless Rails.env.production?
  get "/templates/:path.html" => "templates#file", :constraints => { :path => /.+/  }
  get "main/index"
  root to: "main#index"

end
