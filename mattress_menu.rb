class MattressMenu < MenuTree

  def build_options_nodes model_objects:
    @check_available_op = MattressOperations::CheckAvailableOP.new model_objects: model_objects
    @deposit_op = MattressOperations::DepositOP.new model_objects: model_objects
    @withdrawals_op = MattressOperations::WithdrawalOP.new model_objects: model_objects
  end

  def build_menu_node
    menu_builder = MenuNodeBuilder.new do
      add_option text: "Check the available money", node: @check_available_op.operation_node
      add_option text: "Deposit money", node: @deposit_op.operation_node
      add_option text: "Withdrawal money", node: @withdrawals_op.operation_node
    end
    @menu_node = menu_builder.build
  end

  def setup_back_nodes
    @check_available_op.setup_back node: @menu_node
    @deposit_op.setup_back node: @menu_node
    @withdrawals_op.setup_back node: @menu_node
  end
end
