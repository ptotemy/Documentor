class Example < ActiveRecord::Base

  #-------------------------------------Description-------------------------------------------#

  #These are different examples of a component.
  #when the document is prepared for tests, the component decided by the documentor is replaced by one of the
  #many exmaples of that component.
  #Example consists of an image, which we upload.


  #-------------------------------------***********-------------------------------------------#

  set_table_name :examples
#  attr_accessible :name, :content, :component_id,:example_set_id
  belongs_to :component
  belongs_to :example_set
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