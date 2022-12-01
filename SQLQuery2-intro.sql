select * from [darbuotojas]
select [asmenskodas] from [darbuotojas]
select [vardas], [pavarde], [pareigos] from [darbuotojas]
select distinct [skyrius_pavadinimas] from [darbuotojas]
select * from [darbuotojas] where [skyrius_pavadinimas] = 'C#'
select [pareigos] from [darbuotojas] where [vardas] = 'Giedrius' 
select * from [darbuotojas] where [gimimometai] = '1986-09-19'
select [vardas] from [darbuotojas] where [pavarde] = 'Sabutis'
select [vardas], [pavarde] from [darbuotojas] where [skyrius_pavadinimas]='Java'
insert into [DARBUOTOJAS] (ASMENSKODAS,VARDAS,PAVARDE,DIRBANUO,GIMIMOMETAI,PAREIGOS,SKYRIUS_PAVADINIMAS,PROJEKTAS_ID) values (39005105855,'vytas','vitaitis','2020-01-30','1990-05-25',null,'C#',2)
insert into [DARBUOTOJAS] (ASMENSKODAS,VARDAS,PAVARDE,DIRBANUO,GIMIMOMETAI) values (38905102567,'andrius','sibaila','2022-05-01','1989-05-26')
update [DARBUOTOJAS] set PAREIGOS='programuotojas',SKYRIUS_PAVADINIMAS='java',PROJEKTAS_ID=5 
delete from [DARBUOTOJAS] where ASMENSKODAS=49005100000
insert into DARBUOTOJAS values (123,'jonas','antanaitis','2012-12-20','1990-05-25','programuotojas','java',2),(12345,'antanas','antanaitis','2012-02-20','1989-05-15','programuotojas','c#',5)
update [DARBUOTOJAS] set PAREIGOS='testuotojas'  where PAVARDE='antanaitis'
select count (pareigos)Pareigos from DARBUOTOJAS where PAREIGOS='testuotojas'