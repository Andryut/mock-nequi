class OperationView

  def initialize input_views:
    @input_views = input_views
  end

  def show
    input_data = Hash.new
    input_views.each do |input_view|
      input_data.merge!(input_view.play)
    end
    return input_data
  end
end
