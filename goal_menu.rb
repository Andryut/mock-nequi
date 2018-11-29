class GoalMenu < MenuTree

  def build_operation_nodes session:
    self.build_listar_info_metas_node session: session
    self.build_crear_meta_node session: session
    self.build_cerrar_meta_node session: session
    self.build_agregar_dinero_node session: session
  end

  def build_menu_node
    menu_builder = MenuNodeBuilder.new
    menu_builder.add_option text: "", node: @listar_node
    menu_builder.add_option text: "", node: @crear_node
    menu_builder.add_option text: "", node: @cerrar_node
    menu_builder.add_option text: "", node: @agregar_node
    @menu_node = menu_builder.build
  end

  def setup_back_nodes
    @listar_node.controller.back_node = @menu_node
    @crear_node.controller.back_node = @menu_node
    @cerrar_node.controller.back_node = @menu_node
    @agregar_node.controller.back_node = @menu_node
  end

  protected

  def build_listar_info_metas_node session:
  end

  def build_crear_meta_node session:
  end

  def build_cerrar_meta_node session:
  end

  def build_agregar_dinero_node session:
  end
end
