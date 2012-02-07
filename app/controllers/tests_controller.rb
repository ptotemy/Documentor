class TestsController < ApplicationController

  def index
    @tests = Test.all
    @test = Test.new

  end

  def show

    @test = Test.find(params[:id])

  end

  def new
    @test = Test.new

  end

  def create
    @test = Test.new(params[:test])
    if @test.save

      redirect_to test_integrated_view_path, :notice => "Successfully created test."
    else
      render :new
    end
  end

  def edit
    @test = Test.find(params[:id])
    if !params[:get].nil?
      render :layout=>false
    end
  end

  def update
    @test = Test.find(params[:id])
    if @test.update_attributes(params[:test])
      redirect_to test_integrated_view_path, :notice => "Successfully updated test."
    else
      render :edit
    end
  end

  def destroy
    @test = Test.find(params[:id])
    @test.destroy
    redirect_to test_integrated_view_path, :notice => "Successfully destroyed test."
  end

  def parse_save_from_excel
    test_file = params[:excel_file]
    file = FileUploader.new
    if file.store!(test_file)
      book = Spreadsheet.open "#{file.store_path}"
      sheet1 = book.worksheet 0

      @test = []
      @errors = Hash.new
      @counter = 0

      sheet1.each 1 do |row|
        @counter+=1
        p = Test.new

        p.name = row[0]
        unless Test.find_by_name(p.name)
          if p.valid?
            p.save
          else
            @errors["#{@counter+1}"] = p.errors
          end
        end
      end
      file.remove!
      if @errors.empty?
        redirect_to test, notice: 'All Dummy data were successfully uploaded.'
      else
        redirect_to test, notice: 'There were some errors in your upload'
      end

    else
      redirect_to test, notice: 'Dummy datum could not be successfully uploaded.'
    end
  end

  def integrated_view
    @tests = Test.all
    @test = Test.new
    render :layout=>'scaffold'

  end

  def list_of_documents
    @documents=Document.all
  end

  def generate_test_document
    @document=Document.find(params[:document_id])
    @blank_sections=@document.blank_sections
    @test_doc=TestDoc.new
    @test_doc.document_id=@document.id
    @test_doc.save!

    @test_doc.create_test_doc

    @test_doc_infos=@test_doc.test_doc_infos


  end

  def save_results
    @test_doc=TestDoc.find(params[:test_doc_id])
    @test_doc_infos=@test_doc.test_doc_infos
    @test_doc_infos.each do |test_doc_info|
      @test_result=TestResult.new
      @test_result.test_doc_info_id=test_doc_info.id
      @test_result.answer_key=params[test_doc_info.id.to_s]
      @test_result.save!

    end


  end

  def add_docket

    @test=Test.find(params[:test_id])
    @test.source_id=params[:source_id]
    @test.save!
      @test.generate_tests
    redirect_to test_integrated_view_path

  end
def add_document

    @test=Test.find(params[:test_id])
    @test.source_id=params[:source_id]
    @test.save!
      @test.generate_tests
      redirect_to test_integrated_view_path
  end


end
