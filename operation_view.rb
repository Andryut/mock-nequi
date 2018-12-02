class OperationView

  def initialize input_views:
    @input_views = input_views
  end

  def show
    filled_form = Hash.new
    input_views.each do |input_view|
      filled_form.merge!(input_view.show)
    end
    return filled_form
  end
end
