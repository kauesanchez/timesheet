class PeriodosController < ApplicationController


  def index
    @periodos = Periodo.all
    @periodo = Periodo.new

  
  end
  def show
    @periodo = Periodo.find(params[:id])
  
  end

  def new
    @periodo = Periodo.new
    
    
  end
  def edit
    @periodo = Periodo.find(params[:id])
     
  end

  def create
    @periodo = Periodo.new(params[:periodo])
    
    respond_to do |format|
      if @periodo.save
        flash[:notice] = 'Periodo criado com sucesso.'
        format.html { redirect_to(index) }
    
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @periodo.errors, :status => :unprocessable_entity }
      end
    end
  end
  def update
    @periodo = Periodo.find(params[:id])
    respond_to do |format|
      if @periodo.update_attributes(params[:periodo])
        flash[:notice] = 'Periodo atualizado com sucesso'
        format.html { redirect_to(index) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @periodo.errors, :status => :unprocessable_entity }
      end
    end
  end
  def destroy
    @periodo = Periodo.find(params[:id])
    @periodo.destroy

    respond_to do |format|
      format.html { redirect_to(periodos_url) }
      format.xml  { head :ok }
    end
  end
end
