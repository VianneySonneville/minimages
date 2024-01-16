module Components::MinimageCardHelper
  def card(model)
    content_tag "div", class: "p-4 border rounded" do
      concat content_tag("img", "", src: url_for(model.image), class: "rounded", alt: model.title, width: "225", height: "225")
    end
  end
end