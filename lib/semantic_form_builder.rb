# Custom form builder for Formtastic to enable display of date/datetime fields
# using date picker JS and to display monetary values with a currency symbol hint.
#
class SemanticFormBuilder < Formtastic::SemanticFormBuilder
  
  class_inheritable_accessor :default_monetary_symbol
  
  self.default_monetary_symbol = "&pound;"
      
  def date_input(method, options)
    basic_input_helper(:date_field, :string, method, options)
  end
  
  def datetime_input(method, options)
    basic_input_helper(:date_field, :string, method, options)
  end
  
  def monetary_input(method, options)
    basic_input_helper(:monetary_field, :numeric, method, options)
  end
  
  def date_field(method, html_options)
    html_options[:value] = I18n.l(object.send(method)) unless object.send(method).nil?
    self.send(:text_field, method, html_options) + Formtastic::Util.html_safe('<img src="/images/calendar.gif" />')
  end
  
  def monetary_field(method, html_options)
    self.label(method, {:label => self.default_monetary_symbol, :class => 'currency'}) + self.send(:text_field, method, html_options)
  end
  
end
