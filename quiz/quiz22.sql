emp2 dept2 테이블을 참고하여,

'AL Pacino'와 "같은 지역"에서
근무하는 직원들의 평균 연봉보다
많이 받는 직원들의 사번, 이름, 부서번호, 부서이름, 근무지역, 급여 를 출력하세요.

알파치노 -> (소속부서번호) -> 근무지역
근무지역 -> (부서번호) -> 에 속한 직원 -> 평균연봉
급여 > 평균연봉   정보

select *
from emp2
where name = 'AL Pacino';

select *
from dept2;


select e.empno, e.name, e.deptno, d.dname, d.area, e.pay
from emp2 e, dept2 d
where pay > (select AVG(pay)     --해당 부서번호에 속한 직원들의 평균 연봉
                from emp2
                where deptno IN (select dcode   --해당근무지역인 부서번호
                                    from dept2
                                    where area = ( select area  --부서의 근무지역
                                                    from dept2
                                                    where dcode = ( select deptno  --알파치노 소속부서번호
                                                                      from emp2
                                                                      where name = 'AL Pacino') ) ) )
AND e.deptno = d.dcode;










