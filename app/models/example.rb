class Example < ActiveRecord::Base
 set_table_name :examples
attr_accessible :name, :content ,:component_id
  belongs_to :component
  has_attached_file :content
 
   #validates_presence_of :name
                  #validates_length_of :name ,:maximum=>255
         
   #validates_presence_of :content_file_name
                  #validates_length_of :content_file_name ,:maximum=>255
         
        #Schema Information
    
      #name:string
     
      #content_file_name:string
     
#scopes
#default_scope order('created_at DESC')
end