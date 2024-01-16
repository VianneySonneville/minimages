module Components::TitleHelper
  def title(page_title, actions = [] )
    tag.div class: "title" do
      concat content_tag(:h1, page_title)
      concat title_actions(actions)
    end
  end

  def title_actions(actions)
    tag.div class: "content_action" do
      actions.map do |action|
        concat link(action)
      end
    end
  end
end
