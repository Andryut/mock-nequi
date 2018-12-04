class InputViewBuilder

  def with_petition petition
    @petition = petition
  end

  def with_validation method_name:
    @validation_method_name = method_name
  end

  def with_hash key:
    @key = key
  end

  def build
    return InputView.new petition: @petition, validation_method_name: @validation_method_name, key: @key
  end
end
