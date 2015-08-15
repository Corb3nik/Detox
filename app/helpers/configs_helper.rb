module ConfigsHelper
  def setting_field(config)
    if !!config.value == config.value
      check_box_tag "settings[#{config.var}]", "1", config.value, class: 'pull-right'
    elsif config.value.class == String
      text_field_tag "settings[#{config.var}]", config.value, class: 'input-sm form-control'
    end
  end
end
