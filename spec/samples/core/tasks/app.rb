class App < Morpheus::Base
  # Listing things from apps
  #
  def list
    'Listing ...'
  end

  # Listing Banner for lost users
  def help
    'Banner'
  end
  
  def task_without_comment
  end
  
  private
    def internal_implementation      
    end
end