class TestResult < ActiveRecord::Base
  set_table_name :test_results
  attr_accessible :test_doc_info_id, :answer_key

   #-------------------------------------Description-------------------------------------------#

  #This stores the answers given for each test-doc-info.
  #the answer can be a binary number thats either right or wrong.

  #-------------------------------------***********-------------------------------------------#

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