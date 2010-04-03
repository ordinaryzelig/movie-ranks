module ApplicationHelper
  
  def javascripts
    files = ['application']
    # files << controller_name if File.exists?(Rails.root + "public/javascripts/#{controller_name}.js")
    javascript_include_tag(*files)
  end
  
  def more_javascripts(*files)
    content_for :more_javascripts do
      javascript_include_tag(*files)
    end
  end
  
  def jquery
    content_for :jquery do
      javascript_include_tag 'jquery'
    end
  end
  
  def stylesheets
    stylesheet_link_tag 'layout', controller_name
  end
  
end
