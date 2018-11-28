class InputController

  def initialize key:
    @key = key
  end

  def execute inputed_data:
    return {@key.to_sym => inputed_data}
  end
end
