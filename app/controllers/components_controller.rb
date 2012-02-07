class ComponentsController < ApplicationController

  def index
    @components = Component.all
    @component = Component.new

  end

  def show

    @component = Component.find(params[:id])

  end

  def new
    @component = Component.new

  end

  def create
    @component = Component.new(params[:component])
    if @component.save
      redirect_to component_integrated_view_path, :notice => "Successfully created component."
    else
      render :new
    end
  end

  def edit
    @component = Component.find(params[:id])
    if !params[:get].nil?
      render :layout=>false
    end
  end

  def update
    @component = Component.find(params[:id])
    if @component.update_attributes(params[:component])
      redirect_to component_integrated_view_path, :notice => "Successfully updated component."
    else
      render :edit
    end
  end

  def destroy
    @component = Component.find(params[:id])
    @component.destroy
    redirect_to component_integrated_view_path, :notice => "Successfully destroyed component."
  end

  def parse_save_from_excel
    test_file = params[:excel_file]
    file = FileUploader.new
    if file.store!(test_file)
      book = Spreadsheet.open "#{file.store_path}"
      sheet1 = book.worksheet 0

      @component = []
      @errors = Hash.new
      @counter = 0

      sheet1.each 1 do |row|
        @counter+=1
        p = Component.new


        p.name = row[0]

        p.component_icon_file_name = row[1]
        unless Component.find_by_name_and_component_icon_file_name(p.name, p.component_icon_file_name)
          if p.valid?
            p.save
          else
            @errors["#{@counter+1}"] = p.errors
          end
        end
      end
      file.remove!
      if @errors.empty?
        redirect_to component, notice: 'All Dummy data were successfully uploaded.'
      else
        redirect_to component, notice: 'There were some errors in your upload'
      end

    else
      redirect_to component, notice: 'Dummy datum could not be successfully uploaded.'
    end
  end

  def integrated_view
    @components = Component.all
    @component = Component.new
    render :layout=>'scaffold'

  end
end
