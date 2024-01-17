module Components::MinimageCardHelper
  def minimage_card(model)
      content_tag(
        "img", 
        "", 
        id: dom_id(model),
        src: url_for(model.image), 
        class: "gallery-img", 
        alt: model.title
        )
  end
end