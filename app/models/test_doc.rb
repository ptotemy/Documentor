class TestDoc < ActiveRecord::Base

  #-------------------------------------Description-------------------------------------------#

  #This is the document which is used for tests.
  #It contains a pointer to the document.
  #This way we can reuse the document for different tests

  #-------------------------------------***********-------------------------------------------#

  belongs_to :test

  has_many :test_doc_infos

  def generate_info

    @document=Document.find(self.document_id)
    @document.blank_sections.each do |blank_section|
      @test_doc_info=TestDocInfo.new
      @test_doc_info.test_doc_id=self.id
      @test_doc_info.blank_section_id=blank_section.id
      set=ExampleSet.all.shuffle.first
      examples=set.examples
      example=examples.find_by_component_id(blank_section.component_id)
      #
      #example=Component.find(blank_section.component_id).examples.shuffle.first
      @test_doc_info.example_id=example.id
      @test_doc_info.correct=true
      @test_doc_info.save!

    end
  end


end
