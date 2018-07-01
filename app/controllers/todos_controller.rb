class TodosController < ApplicationController

  before_action :logged_in_user
  before_action :find_todo, only: [:show, :store_edit, :edit, :delete]
  before_action :is_authorised, only: [:show, :store_edit, :edit, :delete]


  def index
    @todos = @current_user.todos
  end

  def create
    @todo = Todo.new
  end

  def show
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
    @todo[:user_id] = @current_user.id


    if @todo.save
      redirect_to '/todos'
      flash[:success] = "todo successfully created!"
    else
      render :create
    end
  end

  def store_edit
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
        render :edit
      end
    end
  end

  def edit
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

  private
    def find_todo
      @todo = Todo.find_by_id(params[:id])
    end

    def is_authorised
      if @todo.user_id != @current_user.id
        flash[:danger] = "Unauthorised"
        redirect_to todos_path
      end

    end
end
