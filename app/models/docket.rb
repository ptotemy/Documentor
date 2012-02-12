class Docket < ActiveRecord::Base

   #-------------------------------------Description-------------------------------------------#

  #This is a collection of document-sets
  #A docket is a complete package of documents.
  #For eg:A" new passport application" is a docket

  #-------------------------------------***********-------------------------------------------#
  #TODO : Add Description


  set_table_name :dockets
  attr_accessible :name
  has_and_belongs_to_many :document_sets



  #validates_presence_of :name
  #validates_length_of :name ,:maximum=>255

  #Schema Information

  #name:string

  #scopes
  #default_scope order('created_at DESC')
end