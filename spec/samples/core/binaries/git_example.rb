class GitExample < Morpheus::Binary
  default :clone
  
  def clone
    "Git clone!"
  end
end