class Test < ActiveRecord::Base
  set_table_name :tests
  attr_accessible :name, :docket_id, :test_type_id
  has_many :test_docs, :dependent => :destroy
  has_and_belongs_to_many :teams

  #validates_presence_of :name
  #validates_length_of :name ,:maximum=>255

  #Schema Information

  #name:string

  #scopes
  #default_scope order('created_at DESC')


  def generate_tests

    #this means its a docket test
    if self.test_type_id==1
      @docket=Docket.find(self.source_id)
      @documents=@docket.documents
      @documents.each do |document|
        @test_doc=TestDoc.new
        @test_doc.document_id=document.id
        @test_doc.test_id=self.id
        @test_doc.save!
        @test_doc.generate_info
      end

    else
      @document=Document.find(self.source_id)
      @test_doc=TestDoc.new
      @test_doc.document_id=@document.id
      @test_doc.test_id=self.id
      @test_doc.save!
      @test_doc.generate_info

    end


  end
end