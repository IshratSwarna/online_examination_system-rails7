require "application_system_test_case"

class ExamTypesTest < ApplicationSystemTestCase
  setup do
    @exam_type = exam_types(:one)
  end

  test "visiting the index" do
    visit exam_types_url
    assert_selector "h1", text: "Exam types"
  end

  test "should create exam type" do
    visit exam_types_url
    click_on "New exam type"

    fill_in "Name", with: @exam_type.name
    fill_in "Status", with: @exam_type.status
    click_on "Create Exam type"

    assert_text "Exam type was successfully created"
    click_on "Back"
  end

  test "should update Exam type" do
    visit exam_type_url(@exam_type)
    click_on "Edit this exam type", match: :first

    fill_in "Name", with: @exam_type.name
    fill_in "Status", with: @exam_type.status
    click_on "Update Exam type"

    assert_text "Exam type was successfully updated"
    click_on "Back"
  end

  test "should destroy Exam type" do
    visit exam_type_url(@exam_type)
    click_on "Destroy this exam type", match: :first

    assert_text "Exam type was successfully destroyed"
  end
end
