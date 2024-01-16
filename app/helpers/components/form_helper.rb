module Components::FormHelper
  def form(**attr, &block)
    content_tag(
      :form, 
      method: attr[:method] || :post,
      action: attr[:action] || url_for(controller: "minimages", action: "create"),
      accept_charset: "UTF-8",
      enctype: attr[:enctype] || "",
      class: "input-validation-required pt-4"
    ) do
      concat hidden_input
      concat(capture(&block))
    end
  end

  def errors_form(model = nil)
    content_tag "sl-alert", variant: :warning, open: true, clasable: nil, class: "alert-closable" do
      concat content_tag("sl-icon", "", slot: :icon, name: "exclamation-triangle")
      concat full_message_errors(model.errors)
    end
  end

  def full_message_errors(errors)
    content_tag "ul" do
      errors.each do |error|
        concat("<li>#{error.full_message}</li>".html_safe)
      end
    end
  end

  def hidden_input(model = nil)
    content_tag :input, "", type: :hidden, name: :authenticity_token, value: form_authenticity_token
  end

  def text_input(model = nil, field, **attr)
    content_tag "sl-input", "", name: "#{model&.class&.name&.downcase}[#{field}]", label: field, value: model.send(field)
  end

  def area_input(model = nil, field, **attr)
    content_tag "sl-textarea", "", name: "#{model&.class&.name&.downcase}[#{field}]", label: field, value: model.send(field)
  end

  def file_input(model = nil, field, **attr)
    content_tag "input", "", type: "file", name: "#{model&.class&.name&.downcase}[#{field}]", label: field, value: model.send(field), style: "padding: 10px 0px 10px 0px", multiple: attr[:multiple] || false
  end

  def action_form
    content_tag :div, class: "flex gap-4" do
      concat submit_button
      concat back_button
    end
  end

  def submit_button
    content_tag "sl-button", type: :submit, variant: :neutral, data: { optional: nil, valid: nil } do
      "Submit"
    end
  end

  def back_button
    content_tag "sl-button", type: :button, href: "javascript:history.back()", variant: :default, data: { optional: nil, valid: nil } do
      "Reset"
    end
  end
end
