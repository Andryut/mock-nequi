class InputViewBuilder

  attr_accessor :petition, :field_type, :key

  def initialize 
    @petition = 'Enter a value'
    @field_type = :text
    @key = :name
  end

  def initialize petition:, field_type: :text, key:
    @petition = petition
    @field_type = field_type
    @key = key
  end

  def build
    return InputView.new petition: @petition, field_type: @field_type, key: @key
  end
end
