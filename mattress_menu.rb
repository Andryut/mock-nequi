class MattressMenu < MenuTree

  def build_operation_nodes session:
    self.build_consultar_disponible_node session: session
    self.build_agregar_dinero_node session: session
    self.build_retirar_dinero_node session: session
  end

  def build_menu_node
    menu_builder = MenuNodeBuilder.new
    menu_builder.add_option text: "", node: @disponible_node
    menu_builder.add_option text: "", node: @consignacion_node
    menu_builder.add_option text: "", node: @retirar_node
    @menu_node = menu_builder.build
  end

  def setup_back_nodes
    @disponible_node.controller.back_node = @menu_node
    @consignacion_node.controller.back_node = @menu_node
    @retirar_node.controller.back_node = @menu_node
  end

  protected

  def build_consultar_disponible_node session:
  end

  def build_agregar_dinero_node session:
  end

  def build_retirar_dinero_node session:
  end
end
