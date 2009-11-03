require File.expand_path(File.dirname(__FILE__) + "/lib/insert_routes.rb")

class RailsStaticPagesGenerator < Rails::Generator::Base 
  
  def manifest
    record do |r|
      r.migration_template 'migration.rb', "db/migrate"
      r.route_name('content', '/infos/:permalink', { :controller => 'infos', :action => 'display' } )
      r.route_resource :infos
    end
  end
  
  def file_name
    "create_rails_static_pages" 
  end
  
end