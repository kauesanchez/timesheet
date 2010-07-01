class ProjetosController < ApplicationController
  def index
    @projetos = Projeto.all
    @projeto = Projeto.new
  end

  def show
    @projeto = Projeto.find(params[:id])
  end

  def new
    @projeto = Projeto.new
  end

  # GET /projetos/1/edit
  def edit
    @projeto = Projeto.find(params[:id])
  end

  def create
    @projeto = Projeto.new(params[:projeto])

    respond_to do |format|
      if @projeto.save
        flash[:notice] = 'Projeto criado com sucesso.'
        format.html { redirect_to(index) }
        format.xml  { render :xml => @projeto, :status => :created, :location => @projeto }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @projeto.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /projetos/1
  # PUT /projetos/1.xml
  def update
    @projeto = Projeto.find(params[:id])

    respond_to do |format|
      if @projeto.update_attributes(params[:projeto])
        flash[:notice] = 'Projeto was successfully updated.'
        format.html { redirect_to(index) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @projeto.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /projetos/1
  # DELETE /projetos/1.xml
  def destroy
    @projeto = Projeto.find(params[:id])
    @projeto.destroy

    respond_to do |format|
      format.html { redirect_to(projetos_url) }
      format.xml  { head :ok }
    end
  end
end
