module Components::FlashMessageHelper
  def success_message(message)
    content_tag "sl-alert", variant: :success, open: true, clasable: true, class: "alert-closable" do
      concat content_tag("sl-icon", "", slot: :icon, name: "check2-circle")
      concat content_tag("span", message)
    end
  end
end