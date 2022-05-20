-- https://en.wikibooks.org/wiki/SQL_Exercises/Scientists
-- 6.1 List all the scientists' names, their projects' names, 
-- and the hours worked by that scientist on each project,
-- in alphabetical order of project name, then scientist name.
select Scientists.Name, Projects.Name, Projects.Hours
from Scientists
         join AssignedTo on Scientists.SSN = AssignedTo.Scientist
         join Projects on AssignedTo.Project = Projects.Code
order by Projects.Name, Scientists.Name;

select distinct Scientist
from AssignedTo;

select *
from AssignedTo;
select *
from Projects;


-- 6.2 Select the project names which are not assigned yet
select Projects.Name
from Projects
where Code not in (select distinct Project from AssignedTo);