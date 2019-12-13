# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# PRIMEIRO CRIAR 3 ALUNOS PELO FRONT-END
# DEPOIS RODAR A TASK DEV_POPULATE

# EDITAL
edital = Notice.new
edital.semestre = "2020.1"
edital.encerrado = false
edital.save

# PROFESSOR
valeria = Teacher.new
valeria.nome = "Valéria Cavalcanti"
valeria.email = "valeria@gmail.com"
valeria.save
###
luiz = Teacher.new
luiz.nome = "Luiz Carlos"
luiz.email = "luiz@gmail.com"
luiz.save

# DISCIPLINA
ape = Subject.new
ape.nome = "Algoritmo e Programação Estruturada"
ape.sigla = "APE"
ape.teacher = valeria
ape.save
###
lm = Subject.new
lm.nome = "Linguagens de Marcação"
lm.sigla = "LM"
lm.teacher = luiz
lm.save

# CANDIDATURA
candidatura_1 = Candidacy.new
candidatura_1.cre = 80.0
candidatura_1.nota = 75
candidatura_1.data = Time.now - 3600 * 3
candidatura_1.user = User.find(1)
candidatura_1.notice = edital
candidatura_1.subject = ape
candidatura_1.save
###
candidatura_2 = Candidacy.new
candidatura_2.cre = 70.0
candidatura_2.nota = 85
candidatura_2.data = Time.now - 3600 * 3
candidatura_2.user = User.find(2)
candidatura_2.notice = edital
candidatura_2.subject = lm
candidatura_2.save
###
candidatura_3 = Candidacy.new
candidatura_3.cre = 91.0
candidatura_3.nota = 70
candidatura_3.data = Time.now - 3600 * 3
candidatura_3.user = User.find(3)
candidatura_3.notice = edital
candidatura_3.subject = lm
candidatura_3.save