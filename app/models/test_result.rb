class TestResult < ActiveRecord::Base
 set_table_name :test_results
attr_accessible :test_doc_info_id, :answer_key
 
   #validates_presence_of :test_doc_info_id
            #validates_numericality_of :test_doc_info_id
               
   #validates_presence_of :answer_key
            #validates_numericality_of :answer_key
               
        #Schema Information
    
      #test_doc_info_id:integer
     
      #answer_key:integer
     
#scopes
#default_scope order('created_at DESC')
end