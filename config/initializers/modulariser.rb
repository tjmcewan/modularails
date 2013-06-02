# setup the ability to load views from "app/#{resource}/views"
custom_pattern = ":prefix/views/:action{.:locale,}{.:formats,}{.:handlers,}"
ActiveSupport.on_load(:action_controller) do
  view_paths << ActionView::FileSystemResolver.new("app", custom_pattern)
end

module_asset_paths = Dir["#{Rails.root}/app/**/"].select{ |dir| dir =~ /app\/.+\/assets/ }
Modularails::Application.config.assets.paths.concat module_asset_paths
