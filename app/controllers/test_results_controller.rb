class TestResultsController < ApplicationController

def index
    @test_results = TestResult.all
    @test_result = TestResult.new

  end
def show

    @test_result = TestResult.find(params[:id])

end
 def new
    @test_result = TestResult.new

  end

def create
    @test_result = TestResult.new(params[:test_result])
if @test_result.save
      redirect_to test_results_url, :notice => "Successfully created test result."
    else
      render :new
    end
  end
 def edit
    @test_result = TestResult.find(params[:id])
if !params[:get].nil?
 render :layout=>false
end
  end

  def update
    @test_result = TestResult.find(params[:id])
if @test_result.update_attributes(params[:test_result])
      redirect_to test_results_url, :notice => "Successfully updated test result."
    else
      render :edit
    end
  end
def destroy
  @test_result = TestResult.find(params[:id])
@test_result.destroy
  redirect_to test_results_url, :notice => "Successfully destroyed test result."
end
def parse_save_from_excel
    test_file = params[:excel_file]
    file = FileUploader.new
    if file.store!(test_file)
      book = Spreadsheet.open "#{file.store_path}"
      sheet1 = book.worksheet 0

       @test_result  = []
      @errors = Hash.new
      @counter = 0

      sheet1.each 1 do |row|
        @counter+=1
        p = TestResult.new



         p.test_doc_info_id = row[0]

         p.answer_key = row[1]
        unless TestResult.find_by_test_doc_info_id_and_answer_key(p.test_doc_info_id,p.answer_key)
          if p.valid?
            p.save
          else
            @errors["#{@counter+1}"] = p.errors
          end
        end
      end
      file.remove!
      if @errors.empty?
        redirect_to test_result, notice: 'All Dummy data were successfully uploaded.'
      else
        redirect_to test_result, notice: 'There were some errors in your upload'
      end

    else
      redirect_to test_result, notice: 'Dummy datum could not be successfully uploaded.'
    end
  end
def integrated_view
  @test_results = TestResult.all
      @test_result = TestResult.new
render :layout=>'scaffold'

end
end
