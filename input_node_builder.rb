class InputNodeBuilder

  def with_petition petition
    @petition = petition
  end

  def with_validation expression:
    @regexp = expression
  end

  def with_hash key:
    @key = key
  end

  def build
    view = InputView.new petition: @petition, regexp: @regexp
    controller = InputController.new key: @key
    return NavigationNode.new view: view, controller: controller
  end
end
