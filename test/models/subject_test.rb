require 'test_helper'

class SubjectTest < ActiveSupport::TestCase
    test "default SubjectTest" do
        @year = Year.new({ year: 2019 });
        @year.save
        @subject =  Subject.new({
            year_id: @year.id,
            subject_name: "test",
            teacher_name: "tt"
        })
        assert @subject.save, "Failed test"            
    end
    test "null SubjectTest" do
        @year = Year.new({ year: 2019 });
        @year.save
        @subject =  Subject.new({
            year_id: @year.id,
            subject_name: "test",
            teacher_name: ""
        })
        assert !@subject.save, "null teacher named saved, Invalid save"            
        @subject =  Subject.new({
            year_id: @year.id,
            subject_name: "",
            teacher_name: "test"
        })
        assert !@subject.save, "null subject named saved, Invalid save"            
    end
    test "Boundary SubjectTest" do
        @year = Year.new({ year: 2019 });
        @year.save
        @subject =  Subject.new({
            year_id: @year.id,
            subject_name: "testtesttesttesttestt",
            teacher_name: ""
        })
        assert !@subject.save, "over 20 length teacher named saved, Invalid save"            
    end
    test "Uniqueness SubjectTest" do
        @year = Year.new({ year: 2019 });
        @year.save
        @subject =  Subject.new({
            year_id: @year.id,
            subject_name: "test",
            teacher_name: "t"
        })
        @subject.save

        @subject2 =  Subject.new({
            year_id: @year.id,
            subject_name: "test",
            teacher_name: "e"
        })

        assert !@subject2.save, "same name Subjects saved, Invalid save"            
    end





  # test "the truth" do
  #   assert true
  # end
end
