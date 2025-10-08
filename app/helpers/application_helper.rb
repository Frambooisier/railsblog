module ApplicationHelper
  include Pagy::Frontend
end

module ApplicationHelper
  def breadcrumbs
    path = request.path.split("/").reject(&:blank?)

    crumbs = []
    path.each_with_index do |part, index|
      name = part.titleize
      url = "/" + path[0..index].join("/")
      crumbs << [name, index < path.length - 1 ? url : nil]
    end
    crumbs
  end
end
