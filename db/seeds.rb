# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@brad = Student.create!(name: 'Brad')
@tom = Student.create!(name: 'Tom')
@jon = Student.create!(name: 'Jon')
@collin = Student.create!(name: 'Collin')

@calc = Course.create!(name: 'Calc')
@econ = Course.create!(name: 'Econ')
@law = Course.create!(name: 'Law')
@psych = Course.create!(name: 'Psych')

@brad_calc = @calc.student_courses.create!(student_id: @brad.id, grade: 85.5)
@brad_econ = @econ.student_courses.create!(student_id: @brad.id, grade: 72.4)
@brad_law = @law.student_courses.create!(student_id: @brad.id, grade: 92.3)

@tom_calc = @calc.student_courses.create!(student_id: @tom.id, grade: 76.5)
@tom_econ = @econ.student_courses.create!(student_id: @tom.id, grade: 99.1)
@btom_psych = @psych.student_courses.create!(student_id: @tom.id, grade: 52.8)

@jon_econ = @econ.student_courses.create!(student_id: @jon.id, grade: 71.1)
@jon_law = @law.student_courses.create!(student_id: @jon.id, grade: 85.2)
@jon_psych = @psych.student_courses.create!(student_id: @jon.id, grade: 68.3)

@collin_calc = @calc.student_courses.create!(student_id: @collin.id, grade: 99.9)
@collin_law = @law.student_courses.create!(student_id: @collin.id, grade: 84.4)
@collin_psych = @psych.student_courses.create!(student_id: @collin.id, grade: 96.8)
