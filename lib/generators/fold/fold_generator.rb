# -*- encoding : utf-8 -*-

require 'generators/fold/atributo'

class FoldGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)

  argument :name, :type => :string, :required => true, :banner => 'Nombre'
  argument :args, :type => :array , :default => []   , :banner => 'Atributos'

  class_option :orden , :desc => 'Soporte para Ordenable.'  , :type => :boolean, :aliases => "-o", :default => false
  class_option :slug  , :desc => 'Soporte pare FriendlyId.' , :type => :boolean, :aliases => "-i", :default => false
  
  def initialize(*arguments, &block)
    super
    
    @con_orden   = options.orden?
    @con_slug    = options.slug?
   
    @singular = @name.downcase
    @plural   = @singular.pluralize
    @class    = @name.camelize
    @classes  = @plural.camelize
    
    @singular_path  = "admin_#{@singular}_path"
    @plural_path    = "admin_#{@plural}_path"
    @new_path       = "new_admin_#{@singular}_path"
    @edit_path      = "edit_admin_#{@singular}_path"
    @reordenar_path = "reordenar_admin_#{@plural}_path"

    @atributos = []
    
    args.each do |arg|
      @atributos << Atributo.new(arg)
    end
    @identificador = @atributos.first.nombre

  end
  
  def body
    template 'model.erb'     , "app/models/#{@singular}.rb"
    template 'migration.erb' , "db/migrate/#{fecha}_create_#{@plural}.rb"
    template 'controller.erb', "app/controllers/admin/#{@plural}_controller.rb"
    template 'helper.erb', "app/helpers/#{@plural}_helper.rb"
    
    %w[_form _mini_form edit index new].each do |action| 
    template "views/#{action}.erb", "app/views/admin/#{@plural}/#{action}.html.erb"
    end
    template "views/nombre.erb", "app/views/admin/#{@plural}/_#{@singular}.html.erb"
    
    resources_route = @con_orden ? "\n    resources :#{@plural} do\n      post :reordenar, :on => :collection\n    end" : "\n    resources :#{@plural}"
    add_admin_route resources_route
      
    template 'cargar.erb', "lib/tasks/cargar_#{@plural}.rake"
  end
  
  private
  
  # Agrega Ruta en namespace :admin
  def add_admin_route(ruta)
    inject_into_file 'config/routes.rb', ruta ,  :after => /namespace :admin do/ 
  end
  
  def self.next_migration_number(dirname) #:nodoc:
    if ActiveRecord::Base.timestamped_migrations
      Time.now.utc.strftime("%Y%m%d%H%M%S")
    else
      "%.3d" % (current_migration_number(dirname) + 1)
    end
  end
  
  def fecha
    Time.now.utc.strftime("%Y%m%d%H%M%S")
  end
  
  def atributos_con_referencia
    @atributos.select {|a| a.clase == :references}
  end
    
end
