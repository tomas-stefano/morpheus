class SuperLs < Morpheus::Binary
  # flag '-l' => :list, '-h' => :help
  
  def default
    '#default method called!'
  end
  
  def list
    'Listing!'
  end
  
  def help
    'Usage: super_ls [OPTIONS]'
  end
end