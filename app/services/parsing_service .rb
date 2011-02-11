#
# A service for parsing the supplied content 
#

class ParsingService

   #
   # Takes a string of tags seperated by spaces or commas 
   # and retuns an array
   #
   def parse_tags (tags)
     tags.split(/[ |,]/)
   end

end
