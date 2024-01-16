module Components::BreadcrumbHelper
  def breadcrumb(items)
    content_tag "sl-breadcrumb", class: "pb-4", variant: :neutral do
      (items || []).map do |item|
        concat breadcrumb_item(item)
      end
    end
  end

  def breadcrumb_item(item)
    content_tag "sl-breadcrumb-item", href: item[:href] do
      item[:label]
    end
  end
end
