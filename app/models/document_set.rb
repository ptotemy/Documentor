class DocumentSet < ActiveRecord::Base
 set_table_name :document_sets
attr_accessible :name, :document_id
  has_many :documents,:dependent => :destroy
  has_and_belongs_to_many :dockets
 
   #validates_presence_of :name
                  #validates_length_of :name ,:maximum=>255
         
   #validates_presence_of :document_id
            #validates_numericality_of :document_id
               
        #Schema Information
    
      #name:string
     
      #document_id:integer
     
#scopes
#default_scope order('created_at DESC')
end