module Components::TitleHelper
  def title(page_title, actions)
    tag.div class: "title" do
      concat content_tag(:h1, page_title)
      concat title_actions(actions[:actions] || {})
    end
  end

  def title_actions(actions)
    tag.div class: "content_action" do
      actions.map do |action|
        concat app_link(action)
      end
    end
  end

  def app_link(action)
    content_tag("sl-button", size: 'small', href: action[:path]) do
      action[:label]
    end
  end
end