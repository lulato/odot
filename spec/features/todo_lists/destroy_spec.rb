require "spec_helper"

describe "deleting todo list" do

  let!(:todo_list) { TodoList.create(title: "Groceries", description: "Groceries list.")}

  it "is succesful when destroying link" do
    visit "/todo_lists"

    within "#todo_list_#{todo_list.id}" do
      click_link "Destroy"
    end
    expect(page).to_not have_content(todo_list.title)
    expect(TodoList.count).to eq(0)
  end

end