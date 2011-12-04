#
# A generic interface to an indexing and searching service 
# This implementation uses Apache SOLR with the default "example"
# schema  
#
#
class SearchService

 
  #
  # Adds a new content item to the index 
  #  
  #
  def add_content_item(item)
    puts "here i am"
    puts item.content
     document = 
     {:id => item.id, 
      :name => item.name, 
      :manu_exact => item.account.name,
      :keywords => item.tags.each.collect{ |t| t.tag_data.name }.join(','),
      :subject => item.content[0..99],
      :text => item.content,
      :created_at_dt => item.created_at.strftime("%Y-%m-%dT%H:%M:%SZ"),
      :last_modified => Time.new.strftime("%Y-%m-%dT%H:%M:%SZ"),
      :author => item.created_by.nick_name}
      
      puts "and here"
    document  = document.merge({:modifier_s => item.updated_by.nick_name}) if item.updated_by  
    response = solr.add document
    response = solr.commit
    #todo - add error handling !
  end

  # Updates the text index for an existing content item
  #
  def update_text(id, content,updated_by)
     documents = [
     {:id => id, 
      :text => content,
      :last_modified => Time.new.strftime("%Y-%m-%dT%H:%M:%SZ"),
      :modifier_s => updated_by}]
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
     item['updated_by'] = doc['modifier_s']
     item['created_at'] = xml_date_to_time(doc['created_at_dt'])
     item['updated_at'] = xml_date_to_time(doc['last_modified'])
     
     created_by=Hash.new
     created_by[:name] = doc['author']
     created_by[:date] = xml_date_to_time(doc['created_at_dt'])  || Time.new #fudge for old data
     item[:created] = created_by
     if doc['modifier_s']
         updated_by=Hash.new
         updated_by[:name] = doc['modifier_s']
         updated_by[:date] = xml_date_to_time(doc['last_modified'])
         item[:updated] = updated_by
      end
      item[:last_modified] = item[:updated] || item [:created]
     results << item
  end
  return results
  end

private 
  def solr 
    RSolr.connect :url => 'http://127.0.0.1:8983/solr'
  end
  
  def xml_date_to_time(date_str)
     #puts date_str
     result =Time.zone.parse(date_str) if date_str
     #puts result
     result
   end
end 
 
