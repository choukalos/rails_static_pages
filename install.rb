require 'fileutils'

dir = File.dirname(__FILE__)
# Install Controllers
FileUtils.cp File.join(dir, 'lib', 'controllers', 'infos_controller.rb'), File.join(dir, '../../../app/controllers/infos_controller.rb')
# Install Models
FileUtils.cp File.join(dir, 'lib', 'models', 'info.rb'), File.join(dir, '../../../app/models/info.rb')
# Install Views
FileUtils.cp_r Dir[File.join(dir, 'lib', 'views', '*')], File.join(dir, '../../../app/views')
# Show the Install documentation
puts IO.read(File.join(File.dirname(__FILE__), 'README'))