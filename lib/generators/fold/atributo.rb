# -*- encoding : utf-8 -*-
class Atributo
  CLASES   = [:string, :text, :integer, :float, :decimal, :datetime, :timestamp, :time, :date, :binary, :boolean, :references]
  VALORES  = [:true, :false, :nil]
  OPCIONES = [:unique, :index, :polymorphic]
  ANCHO = 15
  attr_accessor :nombre, :clase, :default, :opciones

  def initialize(s)
    parametros = s.split(':')

    @nombre = parametros.shift
    @clase = :string if parametros.empty?
    @opciones = []

    parametros.each do |parametro|
      incluir parametro.to_sym
    end

  end

  def incluir(parametro)
    if CLASES.include? parametro
      @clase = parametro
    end

    if VALORES.include? parametro
      @clase ||= :boolean
      @default = parametro
    end

    if OPCIONES.include? parametro
      @opciones << parametro
    end
  end

  def es?(opcion)
    @opciones.include? opcion
  end

  def tiene_opciones?
    ! @opciones.empty?
  end
  
  def ejemplo
    case @clase
    when :string   then "'Lorem Ipsum'"
    when :integer  then rand(50)
    when :boolean  then 'true'      
    else false
    end
  end

end
