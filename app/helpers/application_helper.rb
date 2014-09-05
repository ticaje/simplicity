module ApplicationHelper

  def page_title
    @title || "From Complexity to Simplicity"
  end

  def page_classes
    # one of the classes must be the controller name
    controller.controller_name
  end

end
