namespace :db do
  desc "TODO"
  task dev_populate: :environment do
    # PRIMEIRO CRIAR 8 USERS PELO FRONT-END
    # DEPOIS RODAR A TASK DEV_POPULATE

    # USER
    admin = User.find(1)
    admin.nome = "Administrador"
    admin.admin = true
    admin.matricula = "123456"
    admin.save
    ###############################
    aluno_1 = User.find(2)
    aluno_1.nome = "Aluno 1"
    aluno_1.matricula = "20171370011"
    aluno_1.save
    ###############################
    aluno_2 = User.find(3)
    aluno_2.nome = "Aluno 2"
    aluno_2.matricula = "20171370012"
    aluno_2.save
    ###############################
    aluno_3 = User.find(4)
    aluno_3.nome = "Aluno 3"
    aluno_3.matricula = "20171370013"
    aluno_3.save
    ###############################
    aluno_4 = User.find(5)
    aluno_4.nome = "Aluno 4"
    aluno_4.matricula = "20171370014"
    aluno_4.save
    ###############################
    aluno_5 = User.find(6)
    aluno_5.nome = "Aluno 5"
    aluno_5.matricula = "20171370015"
    aluno_5.save
    ###############################
    aluno_6 = User.find(7)
    aluno_6.nome = "Aluno 6"
    aluno_6.matricula = "20171370016"
    aluno_6.save
    ###############################
    aluno_7 = User.find(8)
    aluno_7.nome = "Aluno 7"
    aluno_7.matricula = "20171370017"
    aluno_7.save

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
    ###############################
    luiz = Teacher.new
    luiz.nome = "Luiz Carlos"
    luiz.email = "luiz@gmail.com"
    luiz.save
    ###############################
    gustavo = Teacher.new
    gustavo.nome = "Gustavo Wagner"
    gustavo.email = "gustavo@gmail.com"
    gustavo.save
    ###############################
    paulo_costa = Teacher.new
    paulo_costa.nome = "Paulo Costa"
    paulo_costa.email = "paulo@email.com"
    paulo_costa.save
    ###############################
    thiago = Teacher.new
    thiago.nome = "Thiago Moura"
    thiago.email = "thiago@email.com"
    thiago.save

    # DISCIPLINA
    ape = Subject.new
    ape.nome = "Algoritmo e Programação Estruturada"
    ape.sigla = "APE"
    ape.periodo = 1
    ape.teacher = valeria
    ape.save
    ###############################
    lm = Subject.new
    lm.nome = "Linguagens de Marcação"
    lm.sigla = "LM"
    lm.periodo = 1
    lm.teacher = luiz
    lm.save
    ###############################
    dist = Subject.new
    dist.nome = "Programação Distribuída"
    dist.sigla = "Prog. Dist."
    dist.periodo = 6
    dist.teacher = gustavo
    dist.save
    ###############################
    bi = Subject.new
    bi.nome = "Inteligência Empresarial"
    bi.sigla = "BI"
    bi.periodo = 6
    bi.teacher = paulo_costa
    bi.save
    ###############################
    ml = Subject.new
    ml.nome = "Tópicos Especiais"
    ml.sigla = "ML"
    ml.periodo = 6
    ml.teacher = thiago
    thiago.save

    # CANDIDATURAS EM APE
    candidatura_1 = Candidacy.new
    candidatura_1.cre = 85.0
    candidatura_1.nota = 95
    candidatura_1.data = Time.now - 3600 * 3
    candidatura_1.user = User.find(2)
    candidatura_1.notice = edital
    candidatura_1.subject = ape
    # candidatura_1.resultado = 'Classificado'
    candidatura_1.save
    ###############################
    candidatura_2 = Candidacy.new
    candidatura_2.cre = 81.3
    candidatura_2.nota = 97
    candidatura_2.data = Time.now - 3600 * 3
    candidatura_2.user = User.find(3)
    candidatura_2.notice = edital
    candidatura_2.subject = ape
    candidatura_2.save
    
    # CANDIDATURAS EM LM
    candidatura_3 = Candidacy.new
    candidatura_3.cre = 75.3
    candidatura_3.nota = 80
    candidatura_3.data = Time.now - 3600 * 3
    candidatura_3.user = User.find(4)
    candidatura_3.notice = edital
    candidatura_3.subject = lm
    candidatura_3.save
    ###############################
    candidatura_4 = Candidacy.new
    candidatura_4.cre = 80
    candidatura_4.nota = 75
    candidatura_4.data = Time.now - 3600 * 3
    candidatura_4.user = User.find(5)
    candidatura_4.notice = edital
    candidatura_4.subject = lm
    candidatura_4.save
    
    #CANDIDATURAS EM PROG. DIST.
    candidatura_5 = Candidacy.new
    candidatura_5.cre = 91.0
    candidatura_5.nota = 90
    candidatura_5.data = Time.now - 3600 * 3
    candidatura_5.user = User.find(6)
    candidatura_5.notice = edital
    candidatura_5.subject = dist
    # candidatura_3.resultado = 'Classificado'
    candidatura_5.save
    ###############################
    candidatura_6 = Candidacy.new
    candidatura_6.cre = 80
    candidatura_6.nota = 75
    candidatura_6.data = Time.now - 3600 * 3
    candidatura_6.user = User.find(7)
    candidatura_6.notice = edital
    candidatura_6.subject = dist
    candidatura_6.save
    
    #CANDIDATURAS EM ML
    candidatura_7 = Candidacy.new
    candidatura_7.cre = 85
    candidatura_7.nota = 79
    candidatura_7.data = Time.now - 3600 * 3
    candidatura_7.user = User.find(8)
    candidatura_7.notice = edital
    candidatura_7.subject = ml
    candidatura_7.save
    
  end

end
