class MainMenu < MenuTree

  def build_operation_nodes session:
    self.build_consultar_disponible_node session: session
    self.build_consultar_total_node session: session
    self.build_ingresar_dinero_node session: session
    self.build_retirar_dinero_node session: session
    self.build_enviar_dinero_node session: session
    self.build_consultar_transacciones_node session: session
    @mattress_menu = MattressMenu.new session: session
    @pocket_menu = PocketMenu.new session: session
    @goal_menu = GoalMenu.new session: session
  end

  def build_menu_node
    menu_builder = MenuNodeBuilder.new
    menu_builder.add_option text: "", node: @disponible_node
    menu_builder.add_option text: "", node: @total_node
    menu_builder.add_option text: "", node: @consignacion_node
    menu_builder.add_option text: "", node: @retiro_node
    menu_builder.add_option text: "", node: @enviar_node
    menu_builder.add_option text: "", node: @consultar_node
    menu_builder.add_option text: "Enter in the mattress menu", node: @mattress_menu.menu_node
    menu_builder.add_option text: "Enter in the pocket menu", node: @pocket_menu.menu_node
    menu_builder.add_option text: "Enter in the goal menu", node: @goal_menu.menu_node
    @menu_node = menu_builder.build
  end

  def setup_back_nodes
    @disponible_node.controller.back_node = @menu_node
    @total_node.controller.back_node = @menu_node
    @consignacion_node.controller.back_node = @menu_node
    @retiro_node.controller.back_node = @menu_node
    @enviar_node.controller.back_node = @menu_node
    @consultar_node.controller.back_node = @menu_node
    @mattress_menu.setup_menu_back text: "Back", node: @menu_node
    @pocket_menu.setup_menu_back text: "Back", node: @menu_node
    @goal_menu.setup_menu_back text: "Back", node: @menu_node
  end

  protected

  def build_consultar_disponible_node session:
  end

  def build_consultar_total_node session:
  end

  def build_ingresar_dinero_node session:
  end

  def build_retirar_dinero_node session:
  end

  def build_enviar_dinero_node session:
  end

  def build_consultar_transacciones_node session:
  end
end
