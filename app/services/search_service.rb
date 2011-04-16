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
     {:id => item.id, 
      :name => item.name, 
      :manu_exact => item.account.name,
      :keywords => item.tags.each.collect{ |t| t.tag_data.name }.join(','),
      :subject => item.content[0..99],
      :text => item.content,
     # :last_modified => Date.new,
      :author => item.created_by.user_name}]
    response = solr.add documents
    response = solr.commit
    #todo - add error handling !
  end

  # Updates the text index for an existing content item
  #
  def update_text(id, content)
     documents = [
     {:id => id, 
      :text => content}]
    response = solr.add documents
    response = solr.commit
    #todo - add error handling !
  end


  #
  # Performs a search using the query term provided
  # For security searching is always scoped to the
  # current account. 
  #  
  def search(account, q) 

  # send a request to /select
  response = solr.get 'select', :params => {:wt => :ruby ,:q => 'manu_exact:"' + account +'" AND (' + q + ')'}

  docs = response['response']['docs']
  results = [] 
  docs.each do |doc|
     item = Hash.new
     item['id'] = doc['id']
     item['name'] = doc['name']
     item['tags'] = doc['keywords'].split(',')
     item['summary'] = doc['subject']
     item['summary'].html_safe if item['summary'] 
     item['created_by'] = doc['author']
     results << item
  end
  return results
  end

private 
  def solr 
    RSolr.connect :url => 'http://127.0.0.1:8983/solr'
  end
end 
 
