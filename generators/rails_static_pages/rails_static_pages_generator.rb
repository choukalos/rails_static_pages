require 'fileutils'
require File.expand_path(File.dirname(__FILE__) + "/lib/insert_routes.rb")

class RailsStaticPagesGenerator < Rails::Generator::Base 
  
  def manifest
    # Setup Paths and filenames
    srcdir = File.dirname(__FILE__)
    trgdir = File.join(srcdir, '../../../app/')
    controllersrc = File.join( srcdir, 'lib', 'controllers')
    modelsrc = File.join( srcdir, 'lib', 'models' )
    viewsrc = File.join ( srcdir, 'lib', 'views' )
    publicsrc = File.join ( srcdir, 'lib', 'public' )
    # Install various files
    %w( infos_controllers ).each do |file|
      FileUtils.cp File.join(controllersrc, "#{file}.rb"), File.join(trgdir,'controllers',"#{file}.rb")
    end
    %w( info ).each do |file|
      FileUtils.cp File.join(modelsrc, "#{file}.rb"), File.join(trgdir,'models',"#{file}.rb")
    end
    %w( * ).each do |file|
      FileUtils.cp_r File.join(viewsrc, "#{file}.rb"), File.join(trgdir,'views',"#{file}.rb")
    end
    FileUtils.cp File.join(publicsrc, 'widgEditor.js'), File.join(trgdir, '../public/javascripts/', 'widgEditor.js')
    FileUtils.cp File.join(publicsrc, 'widgEditor.css'), File.join(trgdir, '../public/stylesheets/', 'widgEditor.css')  
    # Copy test files
    
    
    record do |r|
      # Copy relevent files
      r.migration_template 'migration.rb', "db/migrate"
      # Setup Routes
      r.route_name('content', '/content/:permalink', { :controller => 'infos', :action => 'display' } )
      r.route_resources :infos
    end
  end
  
  def file_name
    "create_rails_static_pages" 
  end
  
end