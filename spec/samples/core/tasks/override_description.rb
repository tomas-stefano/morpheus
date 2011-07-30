class MyDescription < Morpheus::Description
  def parse!
    "Super description"
  end
end

class FactoryExampleTasks < Morpheus::Base
end

class DescriptionExampleTasks < Morpheus::Base
  def self.description
    MyDescription
  end
  def list
  end
end
 
class OverrideDescriptionTask < Morpheus::Base
  self.description = MyDescription
  def list
  end
end

class OverrideDescriptionSecondVersion < Morpheus::Base
  description MyDescription
  def list
  end
end
