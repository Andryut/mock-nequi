class View

  def show
  end

  def clean_screen
    Gem.win_platform? ? (system "cls") : (system "clear")
  end
end
