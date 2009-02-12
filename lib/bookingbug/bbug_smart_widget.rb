module BookingBug
  
  class SmartWidget < BookingBug::Widget
    
    def initialize(values)
      super(values)
    end
    
    def self.render(values = {})
      if BookingBug::Widget.validate_company
        smart_widget = BookingBug::SmartWidget.new(values)
        script = "<script type=\"text/javascript\" src=\"http://#{BBUG_URL}/widget/all"
        script += smart_widget.get_params_string(:id => smart_widget.company_id, :bgcol => smart_widget.background_color, :scheme => smart_widget.scheme, :style => smart_widget.style, :resize => smart_widget.host)
        script += "\">"
        script += "</script>"
        return script
      else
        return "<div style='border: 1px solid #AAAAAA; font-weight: bold; padding: 5px;'>Something went wrong. This is probably due to invalid credentails.</div>"
      end
    end
    
  end
  
end
