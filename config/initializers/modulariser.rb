# setup the ability to load views from "app/#{resource}/views"
custom_pattern = ":prefix/views/:action{.:locale,}{.:formats,}{.:handlers,}"
ActiveSupport.on_load(:action_controller) do
  view_paths << ActionView::FileSystemResolver.new("app", custom_pattern)
end

# setup assets for each non-rails folder under app/
default_folders = ["assets", "controllers", "helpers", "mailers", "models", "views"]
namespaces = Dir['app/*/'].map{ |a| File.basename(a) } - default_folders
namespaces.each do |namespace|
  Modularails::Application.config.assets.paths << Rails.root.join("app/#{namespace}/assets")
end
