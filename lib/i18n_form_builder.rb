class I18nFormBuilder < ActionView::Helpers::FormBuilder
  def label(method, text = nil, options = {})
    text = I18n.t :"#{method}", :scope => [:activerecord, :attributes, :"#{@object_name}"], :default => method.to_s.humanize if text.nil?
    #Finally hand off to super to deal with the display of the label
    super(method, text, options)
  end
end