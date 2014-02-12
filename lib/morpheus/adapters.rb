module Morpheus
  module Adapters
    extend ActiveSupport::Autoload

    autoload :Solr
    autoload :ElasticSearch
    autoload :Sphinx
  end
end