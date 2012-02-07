class BlankSection < ActiveRecord::Base
 set_table_name :blank_sections
attr_accessible :document_id, :component_id, :xpos, :ypos, :width, :height
  belongs_to :document
  belongs_to :component
 
   #validates_presence_of :document_id
            #validates_numericality_of :document_id
               
   #validates_presence_of :component_id
            #validates_numericality_of :component_id
               
   #validates_presence_of :xpos
            #validates_numericality_of :xpos
               
   #validates_presence_of :ypos
            #validates_numericality_of :ypos
               
   #validates_presence_of :width
            #validates_numericality_of :width
               
   #validates_presence_of :height
            #validates_numericality_of :height
               
        #Schema Information
    
      #document_id:integer
     
      #component_id:integer
     
      #xpos:integer
     
      #ypos:integer
     
      #width:integer
     
      #height:integer
     
#scopes
#default_scope order('created_at DESC')
end