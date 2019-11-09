module Api
    module V1
        class TodosController < ApplicationController
            def index
                todos = Todo.order('created_at DESC')
                render json: {status:'SUCCESS', message:'Loaded todos', data:todos},status: :ok
            end

            def show
                todo = Todo.find(params[:id])
                render json: {status:'SUCCESS', message:'Loaded todo', data:todo},status: :ok
            end

            def create
                todo = Todo.new(todo_params)
                if todo.save
                    render json: {status:'SUCCESS', message:'Saved todo', data:todo},status: :ok
                else 
                    render json: {status:'ERROR', message:'Todo not saved', todo:errors},status: :unprocessable_entity
                end
            end

            def destroy
                todo = Todo.find(params[:id])
                todo.destroy
                render json: {status:'SUCCESS', message:'Deleted todo', data:todo},status: :ok
            end

            def update
                todo = Todo.find(params[:id])
                if todo.update_attributes(todo_params)
                    render json: {status:'SUCCESS', message:'Updated todo', data:todo},status: :ok
                else
                    render json: {status:'ERROR', message:'Todo not updated', todo:errors},status: :unprocessable_entity
                end
            end

            private

            def todo_params
                params.permit(:title, :description, :assignee)
            end

        end
    end
end