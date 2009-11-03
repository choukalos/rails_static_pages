class RailsStaticPagesGenerator < Rails::Generator::Base 
  
  def manifest
    record do |r|
      r.migration_template 'migration.rb', "db/migrate"
    end
  end
  
  def file_name
    "create_rails_static_pages" 
  end
  
end