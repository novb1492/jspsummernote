# jspsummernote

학원에 제출할 과제입니다
간단한 게시판을 만들어봤습니다

1.버튼들을 다 비동기로 하려고했는데
뭐를 잘못긁어왔는지..
이미지만 잘 넘어가고 
남어지는 ajax/xmlhttprequest로 넘겨도 값이 null로 나옵니다

2.글 최대글자는 1000글자/댓글은 200글자인데
에디터 사용시 태그들 까지 같이 오기 떄문에..
그생각을 못하고 유효성검사를 만들었습니다


3.오라클로 페이징을 처음시도했는데
limit가 없어서 지옥같은 경험을 했습니다
12버전이상에는 비슷한게 있다고 하는거 같은데 
일단 받은 11버전으로 만들었습니다

4.db=오라클

article
 Name                                      Null?    Type

 AID                                                NUMBER
 TITLE                                     NOT NULL VARCHAR2(50)
 HIT                                                NUMBER
 AEMAIL                                    NOT NULL VARCHAR2(50)
 ATEXT                                     NOT NULL VARCHAR2(1000)
 ACREATED                                           TIMESTAMP(6)
 
 coment
  Name                                      Null?    Type

 CID                                       NOT NULL NUMBER
 CAID                                      NOT NULL NUMBER
 CEMAIL                                    NOT NULL VARCHAR2(50)
 CCREATED                                  NOT NULL TIMESTAMP(6)
 CTEXT                                     NOT NULL VARCHAR2(200)
 

 
 
 
 
 


