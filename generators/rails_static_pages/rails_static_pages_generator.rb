require File.expand_path(File.dirname(__FILE__) + "/lib/insert_routes.rb")

class RailsStaticPagesGenerator < Rails::Generator::Base 
  
  def manifest
    record do |r|
      r.migration_template 'migration.rb', "db/migrate"
      r.route_name('content', '/content/:permalink', { :controller => 'infos', :action => 'display' } )
      r.route_resources :infos
    end
  end
  
  def file_name
    "create_rails_static_pages" 
  end
  
end