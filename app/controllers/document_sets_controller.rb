class DocumentSetsController < ApplicationController

  def index
    @document_sets = DocumentSet.all
    @document_set = DocumentSet.new

  end

  def show

    @document_set = DocumentSet.find(params[:id])

  end

  def new
    @document_set = DocumentSet.new
    @document=Document.new

  end

  def create
    @document_set = DocumentSet.new(params[:document_set])
    if @document_set.save
      redirect_to document_sets_integrated_view_path, :notice => "Successfully created document set."
    else
      render :new
    end
  end

  def edit
    @document_set = DocumentSet.find(params[:id])
    if !params[:get].nil?
      render :layout=>false
    end
  end

  def update
    @document_set = DocumentSet.find(params[:id])
    if @document_set.update_attributes(params[:document_set])
      redirect_to document_sets_integrated_view_path, :notice => "Successfully updated document set."
    else
      render :edit
    end
  end

  def destroy
    @document_set = DocumentSet.find(params[:id])
    @document_set.destroy
    redirect_to document_sets_integrated_view_path, :notice => "Successfully destroyed document set."
  end

  def parse_save_from_excel
    test_file = params[:excel_file]
    file = FileUploader.new
    if file.store!(test_file)
      book = Spreadsheet.open "#{file.store_path}"
      sheet1 = book.worksheet 0

      @document_set = []
      @errors = Hash.new
      @counter = 0

      sheet1.each 1 do |row|
        @counter+=1
        p = DocumentSet.new


        p.name = row[0]

        p.document_id = row[1]
        unless DocumentSet.find_by_name_and_document_id(p.name, p.document_id)
          if p.valid?
            p.save
          else
            @errors["#{@counter+1}"] = p.errors
          end
        end
      end
      file.remove!
      if @errors.empty?
        redirect_to document_set, notice: 'All Dummy data were successfully uploaded.'
      else
        redirect_to document_set, notice: 'There were some errors in your upload'
      end

    else
      redirect_to document_set, notice: 'Dummy datum could not be successfully uploaded.'
    end
  end

  def integrated_view
    @document_sets = DocumentSet.all
    @document_set = DocumentSet.new

    render :layout=>'scaffold'

  end
end
