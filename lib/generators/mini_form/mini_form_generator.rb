# -*- encoding : utf-8 -*-
class MiniFormGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)
  
  def initialize(*arguments, &block)
    super
  end
  def body
    copy_file 'mini_form.rb', 'lib/mini_form.rb'
  end
end
