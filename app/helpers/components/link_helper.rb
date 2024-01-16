module Components::LinkHelper
  def link(action)
    content_tag("sl-button", size: 'small', href: action[:href]) do
      action[:label]
    end
  end
end