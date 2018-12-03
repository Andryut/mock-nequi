class InputViewBuilder

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
    return InputView.new petition: @petition, regexp: @regexp, key: @key
  end
end
