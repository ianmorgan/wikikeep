#
# A generic interface to an indexing and searching service 
# This implementation uses Apache SOLR with the default "example"
# schema  
#
#
class SearchService

 
  #
  # Adds a new content item to the 
  #  
  #
  def add_content_item(item)
     documents = [
     {:id=>10000000 + item.id, 
      :name=>item.name, 
      :manu_exact => item.account.name,
      :keywords => item.tags.each.collect {|t| t.tag_data.name }.join (','),
      :text =>item.content}]
    response = solr.add documents
    puts response
    response = solr.commit
    puts response
  end

private 
  def solr 
    RSolr.connect :url => 'http://127.0.0.1:8983/solr'
  end
end 
 
