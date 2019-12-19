namespace :db do
  desc "TODO"
  task dev_populate: :environment do
    # PRIMEIRO CRIAR 3 ALUNOS PELO FRONT-END
    # DEPOIS RODAR A TASK DEV_POPULATE

    # USER
    aluno_1 = User.find(1)
    aluno_1.nome = "Paulo Ferreira"
    aluno_1.save
    ###
    aluno_2 = User.find(2)
    aluno_2.nome = "William Abdon"
    aluno_2.save
    ###
    aluno_3 = User.find(3)
    aluno_3.nome = "Tales Araújo"
    aluno_3.save

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
    ###
    gustavo = Teacher.new
    gustavo.nome = "Gustavo Wagner"
    gustavo.email = "gustavo@gmail.com"
    gustavo.save
    ###
    paulo_costa = Teacher.new
    paulo_costa.nome = "Paulo Costa"
    paulo_costa.email = "paulo@email.com"
    paulo_costa.save
    ###
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
    ###
    lm = Subject.new
    lm.nome = "Linguagens de Marcação"
    lm.sigla = "LM"
    lm.periodo = 1
    lm.teacher = luiz
    lm.save
    ###
    dist = Subject.new
    dist.nome = "Programação Distribuída"
    dist.sigla = "Prog. Dist."
    dist.periodo = 6
    dist.teacher = gustavo
    dist.save
    ###
    bi = Subject.new
    bi.nome = "Inteligência Empresarial"
    bi.sigla = "BI"
    bi.periodo = 6
    bi.teacher = paulo_costa
    bi.save
    ###
    ml = Subject.new
    ml.nome = "Tópicos Especiais"
    ml.sigla = "ML"
    ml.periodo = 6
    ml.teacher = thiago
    thiago.save

    # CANDIDATURA
    candidatura_1 = Candidacy.new
    candidatura_1.cre = 85.0
    candidatura_1.nota = 95
    candidatura_1.data = Time.now - 3600 * 3
    candidatura_1.user = User.find(1)
    candidatura_1.notice = edital
    candidatura_1.subject = ape
    # candidatura_1.resultado = 'Classificado'
    candidatura_1.save
    ###
    candidatura_2 = Candidacy.new
    candidatura_2.cre = 90.0
    candidatura_2.nota = 85
    candidatura_2.data = Time.now - 3600 * 3
    candidatura_2.user = User.find(2)
    candidatura_2.notice = edital
    candidatura_2.subject = lm
    candidatura_2.save
    ###
    candidatura_3 = Candidacy.new
    candidatura_3.cre = 91.0
    candidatura_3.nota = 90
    candidatura_3.data = Time.now - 3600 * 3
    candidatura_3.user = User.find(3)
    candidatura_3.notice = edital
    candidatura_3.subject = bi
    # candidatura_3.resultado = 'Classificado'
    candidatura_3.save
  end

end
