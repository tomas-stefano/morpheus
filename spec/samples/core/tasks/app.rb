class App < Morpheus::Base
  default :list
  
  # Listing things from apps
  #
  def list
    'Listing ...'
  end

  # Listing Banner for lost users
  # Simple Explain in how to use the App
  # :)
  #
  def help
    'Usage: app_command file.rb [Options]'
  end
  
  def task_without_comment
  end
  
  private
    def internal_implementation      
    end
end