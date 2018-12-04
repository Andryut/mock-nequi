class UIValidator

  def self.is_a_valid type_of_validation, value
    if (type_of_validation == :email or
        type_of_validation == :number or
        type_of_validation == :password or
        type_of_validation == :name or
        type_of_validation == :day)
    then
      return route type_of_validation, value
    else
      return true
    end
  end

  protected

  def self.route method_name, value
    return send(method_name, value)
  end

  def self.email value
    unless /@/ =~ value and /\./ =~ value and (/@/ =~ value) != 0 and (/\./ =~ value) != 0
      Error.new message: 'Wrong email, introduce a valid email' do |error|
        error.show
      end
      return false
    end
    return true
  end

  def self.number value
    value.each_char do |chr|
      unless chr.to_i.to_s == chr
        Error.new message: "#{value} is not a valid number, introduce a valid number" do |error|
          error.show
        end
        return false
      end
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
      error_cause = "digit"
    end
    unless error_cause = ""
      Error.new message: "The password must contain almost one #{error_cause} character" do |error|
        error.show
      end
      return false
    end
    return true
  end

  def self.name value
    if /[0-9]/ =~ value then
      Error.new message: "The names can't contain numbers" do |error|
        error.show
      end
      return false
    end
    return true
  end

  def self.day value
    value.each_char do |chr|
      unless chr.to_i.to_s == chr
        Error.new message: "#{value} is not a valid number, introduce a valid number" do |error|
          error.show
        end
        return false
      end
    end
    return true
  end
end
