class PocketMenu < MenuTree

  def build_operation_nodes session:
    self.build_listar_bolsillos_info_node session: session
    self.build_crear_bolsillo_node session: session
    self.build_eliminar_bolsillo_node session: session
    self.build_agregar_dinero_node session: session
    self.build_retirar_dinero_node session: session
    self.build_enviar_dinero_node session: session
  end

  def build_menu_node
    menu_builder = MenuNodeBuilder.new
    menu_builder.add_option text: "", node: @listar_node
    menu_builder.add_option text: "", node: @crear_node
    menu_builder.add_option text: "", node: @eliminar_node
    menu_builder.add_option text: "", node: @agregar_node
    menu_builder.add_option text: "", node: @retirar_node
    menu_builder.add_option text: "", node: @enviar_node
    @menu_node = menu_builder.build
  end

  def setup_back_nodes
    @listar_node.controller.back_node = @menu_node
    @crear_node.controller.back_node = @menu_node
    @eliminar_node.controller.back_node = @menu_node
    @agregar_node.controller.back_node = @menu_node
    @retirar_node.controller.back_node = @menu_node
    @enviar_node.controller.back_node = @menu_node
  end

  protected

  def build_listar_bolsillos_info_node session:
  end

  def build_crear_bolsillo_node session:
  end

  def build_eliminar_bolsillo_node session:
  end

  def build_agregar_dinero_node session:
  end

  def build_retirar_dinero_node session:
  end

  def build_enviar_dinero_node session:
  end
end
