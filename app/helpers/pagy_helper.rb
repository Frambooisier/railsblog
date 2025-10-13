module PagyHelper
  include Pagy::Frontend

  def pagy_nav_daisyui(pagy)
    pagy_nav(pagy).gsub('<a', '<a class="btn btn-xs mx-1"').html_safe
  end
end
