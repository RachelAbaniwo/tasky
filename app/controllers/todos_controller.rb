class TodosController < ApplicationController
  
  def index
    @todos = Todo.all
  end
  
  def create
  end

  def show
    @todo = Todo.find_by_id(params[:id])
    if !@todo
      redirect_to '/todos'
      flash[:danger] = "todo not found"
    end
  end
  
  def store

    @todo = Todo.new
    @todo[:title] = params[:title]
    @todo[:description] = params[:desc]
    completed = params[:completed] == 'on'
    @todo[:completed] = completed

    @todo.save 
    if @todo.save
      redirect_to '/todos'
      flash[:success] = "todo successfully created!"
    else
      flash[:danger] = "Error!"
    end
  end

  def store_edit
    @todo = Todo.find_by_id(params[:id])

    if !@todo
      redirect_to '/todos'
      flash[:danger] = "todo not found"
    else

      @todo[:title] = params[:title]
      @todo[:description] = params[:desc]
      completed = params[:completed] == 'on'
      @todo[:completed] = completed

      @todo.save 
      if @todo.save
        redirect_to '/todos'
        flash[:success] = "todo successfully updated!"
      else
        flash[:danger] = "Error!"
      end
    end
  end
  
  def edit
    @todo = Todo.find_by_id(params[:id])

    if !@todo
      redirect_to '/todos'
      flash[:danger] = "todo not found"
    end

  end
  
  def delete
    @todo = Todo.find_by_id(params[:id])

    if !@todo
      redirect_to '/todos'
      flash[:danger] = "todo not found"
    else
      @todo.destroy
      if @todo.destroy
        redirect_to '/todos'
        flash[:success] = "todo successfully deleted!"
      else
        flash[:danger] = "Error!"
      end
    end
  end

end
