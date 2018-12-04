class InputValidator

  def self.is_valid field_type:, value:
    begin
      return route type_of_validation, value
    rescue
      raise 'Invalid type of validation'
    end
  end

  protected

  def self.route method_name, value
    return send(method_name, value)
  end

  def self.email value
    unless /@/ =~ value and /\./ =~ value and (/@/ =~ value) != 0 and (/\./ =~ value) != 0
      Error.new(message: 'Wrong email, introduce a valid email') { |error| error.show }
      return false
    end
    return true
  end

  def self.number value
    unless /\A-?(?:\d+(?:\.\d*)?|\.\d+)\z/ =~  value
      Error.new(message: "#{value} is not a valid number, introduce a valid number") { |error| error.show }
      return false
    end
    return true
  end
  def self.text value
    unless value.strip.length > 0
      Error.new(message: "#{value} is not a valid text, introduce a valid text") { |error| error.show }
    end
    return true
  end
  def self.password value
    error_cause = ""
    if (/[a-z]/ =~ value).nil?
      error_cause = "downcase letter"
    elsif (/[A-Z]/ =~ value).nil?
      error_cause = "upcase letter"
    elsif (/[0-9]/ =~ value).nil?
      error_cause = "digit number"
    end
    unless error_cause == ""
      Error.new(message: "The password must contain almost one #{error_cause} character") { |error| error.show }
      return false
    end
    return true
  end

  def self.name value
    if /[^a-zA-Z]/ =~ value then
      Error.new(message: "The names must be compossed uniquely by letters") { |error| error.show }
      return false
    end
    return true
  end

  def self.day value
    value.each_char do |chr|
      unless chr.to_i.to_s == chr
        Error.new(message: "#{value} is not a valid number, introduce a valid number") { |error| error.show }
        return false
      end
    end
    return true
  end
end
