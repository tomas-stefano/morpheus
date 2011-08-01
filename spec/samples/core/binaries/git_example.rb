class GitExample < Morpheus::Binary
  default :clone
  options :squash => :string, :author => :string
  
  def clone
    "Git clone!"
  end
end