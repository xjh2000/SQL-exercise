--  The Warehouse
--  lINK: https://en.wikibooks.org/wiki/SQL_Exercises/The_warehouse
--  3.1 Select all warehouses.
select *
from Warehouses;
select *
from Boxes;
--  3.2 Select all boxes with a value larger than $150.
select *
from Boxes
where Value >= 150;

--  3.3 Select all distinct contents in all the boxes.
select distinct Contents
from Boxes;
--  3.4 Select the average value of all the boxes.
select avg(Value)
from Boxes;

--  3.5 Select the warehouse code and the average value of the boxes in each warehouse.
select Warehouses.Location, Warehouses.Code, avg(Boxes.Value)
from Warehouses,
     Boxes
where Warehouse = Warehouses.Code
group by Warehouses.Code;

--  3.6 Same as previous exercise, but select only those warehouses where the average value of the boxes is greater than 150.
select Warehouses.Location, Warehouses.Code, avg(Boxes.Value)
from Warehouses,
     Boxes
where Warehouse = Warehouses.Code
group by Warehouses.Code
having avg(Boxes.Value) > 150;


--  3.7 Select the code of each box, along with the name of the city the box is located in.
select Boxes.Code, Warehouses.Capacity
from Warehouses,
     Boxes
where Warehouse = Warehouses.Code;

--  3.8 Select the warehouse codes, along with the number of boxes in each warehouse.
--  Optionally, take into account that some warehouses are empty (i.e., the box count should show up as zero, instead of omitting the warehouse from the result).
select Warehouse, count(*)
from Boxes
group by Warehouse;

--  3.9 Select the codes of all warehouses that are saturated (a warehouse is saturated if the number of boxes in it is larger than the warehouse's capacity).
select Warehouse, count(*) count , Warehouses.Capacity
from Boxes,
     Warehouses
where Boxes.Warehouse = Warehouses.Code
group by Warehouse;


select Warehouses.Code, Warehouses.Capacity, warehouse_Boxes_count.count
from Warehouses,
     (select Warehouse, count(*) count from Boxes group by Warehouse) warehouse_Boxes_count
where Warehouses.Code = warehouse_Boxes_count.Warehouse
  and Warehouses.Capacity <= warehouse_Boxes_count.count;

--  3.10 Select the codes of all the boxes located in Chicago.
select *
from Boxes,
     Warehouses
where Warehouse = Warehouses.Code
  and Warehouses.Location = 'Chicago';
--  3.11 Create a new warehouse in New York with a capacity for 3 boxes.
insert into Warehouses (Code, Location, Capacity)
VALUES (6, 'New York', 3);

--  3.12 Create a new box, with code "H5RT", containing "Papers" with a value of $200, and located in warehouse 2.
insert into Boxes (Code, Contents, Value, Warehouse)
values ('H5RT','Papers',200,2);
-- 3.13 Reduce the value of all boxes by 15%.
select *
from Boxes;

update Boxes
set Value = Value * 0.85;

-- 3.14 Remove all boxes with a value lower than $100.
delete
from Boxes
where Value <= 100;

--  3.15 Remove all boxes from saturated warehouses.
delete
from Boxes
where Warehouse in (select Warehouses.Code Warehouse
                    from Warehouses,
                         (select Warehouse, count(*) count from Boxes group by Warehouse) warehouse_Boxes_count
                    where Warehouses.Code = warehouse_Boxes_count.Warehouse
                      and Warehouses.Capacity <= warehouse_Boxes_count.count) ;

--  3.16 Add Index for column "Warehouse" in table "boxes"
--  !!!NOTE!!!: index should NOT be used on small tables in practice
create index index_warehouse on Boxes (Warehouse);

--  3.17 Print all the existing indexes
--  !!!NOTE!!!: index should NOT be used on small tables in practice
show index from Boxes;

--  3.18 Remove (drop) the index you added just
--  !!!NOTE!!!: index should NOT be used on small tables in practice
alter table Boxes drop index index_warehouse


