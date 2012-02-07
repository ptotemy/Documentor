class ExamplesController < ApplicationController

  def index
    @examples = Example.all
    @example = Example.new

  end

  def show

    @example = Example.find(params[:id])

  end

  def new
    @example = Example.new

  end

  def create
    @example = Example.new(params[:example])
    if @example.save
      redirect_to example_integrated_view_path(:component_id=>@example.component_id), :notice => "Successfully created example."
    else
      render :new
    end
  end

  def edit
    @example = Example.find(params[:id])
    @component=Component.find(@example.component_id)
    if !params[:get].nil?
      render :layout=>false
    end
  end

  def update
    @example = Example.find(params[:id])
    if @example.update_attributes(params[:example])
      redirect_to example_integrated_view_path(:component_id=>@example.component_id), :notice => "Successfully updated example."
    else
      render :edit
    end
  end

  def destroy
    @example = Example.find(params[:id])
    @example.destroy
    redirect_to component_integrated_view_path, :notice => "Successfully destroyed example."
  end

  def parse_save_from_excel
    test_file = params[:excel_file]
    file = FileUploader.new
    if file.store!(test_file)
      book = Spreadsheet.open "#{file.store_path}"
      sheet1 = book.worksheet 0

      @example = []
      @errors = Hash.new
      @counter = 0

      sheet1.each 1 do |row|
        @counter+=1
        p = Example.new


        p.name = row[0]

        p.content_file_name = row[1]
        unless Example.find_by_name_and_content_file_name(p.name, p.content_file_name)
          if p.valid?
            p.save
          else
            @errors["#{@counter+1}"] = p.errors
          end
        end
      end
      file.remove!
      if @errors.empty?
        redirect_to example, notice: 'All Dummy data were successfully uploaded.'
      else
        redirect_to example, notice: 'There were some errors in your upload'
      end

    else
      redirect_to example, notice: 'Dummy datum could not be successfully uploaded.'
    end
  end

  def integrated_view
      @component=Component.find(params[:component_id])
    @examples = @component.examples
    @example = Example.new

    render :layout=>'scaffold'

  end
end
