## v1.0.0
* Eliminación de mini_form generator
* Eliminación de vista _mini_form.erb
* Index ahora tiene buscador y paginación
* Controller ahora usa Ordenable en lugar de Sortable
* Controller adaptado a buscador
* Botones importantes ahora a la derecha del titulo

## v0.0.7
* Mejorado boton para Ordenar
* Id de tablas ahora corresponde al tableize de la clase del elemento, en lugar de a :listado (esto permite trabajar con multiples tablas).
* Friendly Id ahora usa el identificador como slug

## v0.0.6
* Botones alineados a la derecha en Administración
* Quitado boton 'ver' de edit, ya que no existe el show

## v0.0.5
* Edit y New ahora tienen su propio header, y votones para volver y ver, en lugar de Cancelar 
* _form ahora es solo el formulario

## v0.0.4
* Refactoring

## v0.0.3
* agregado index y unique a slug en migrations
* eliminado helper
* model solo muestra private si es necesario
* model, controller tiene menos espacios en blanco
* agregado style="text-align:right" al <td> para alinear botones a la derecha
