
select * from s_user;
--书的大类
 drop table s_cate;
 create table s_cate (
 id number primary key,
 name varchar2(100)
) ;
--书的小类
drop table  s_cate_detail;
create table s_cate_detail (
  id number primary key,
  name varchar2(100) ,
  category_id number references s_cate(id)
) ;
select distinct publish
from s_product s,s_cate c,s_cate_detail d
where s.cate_detail_id=d.id and d.category_id=c.id and c.id=1 
--书
drop table s_product;
create table s_product (
 id number primary key,
 name varchar2(60),
 price number,
 publish varchar2(60),
 img varchar2(1000),
 parameter varchar2(2400),
 introduction varchar2(3600),
 wraplist varchar2(2400),
 hot number,
 remain number,
 sellnum number,
 clickrate number,
 publishdate date ,
 cate_detail_id number references s_cate_detail (id) on delete cascade
);
--用户
drop table s_user;
create table s_user (
  id number primary key,
  username varchar2(30),
  password varchar2(30),
  zip varchar2(60),
  address varchar2(60),
  phone varchar2(60),
  email varchar2(60),
  dob date
) 
--订单
drop table  s_order;
create table s_order (
  id number primary key,
  orderid varchar2(60) ,
  paystatus number,
  receivename varchar2(60),
  receiveaddress varchar2(240),
  receivephone varchar2(60),
  sum number,
  dob number,
  user_id number references s_user(id) 
);
--订单项
drop table orderline;
create table  orderline (
  id number primary key,
  num number,
  order_id number  references s_order (id) on delete cascade,
  product_id number references s_product(id)
) ;
--价格区间
drop table s_price_scope;
create table s_price_scope (
  id number primary key,
  min number ,
  max number
) ;

---公告
drop table s_report;
create table s_report (
  id number primary key,
  name varchar2(60),
  rank number,
  publish_date date,
  department varchar2(60),
  publish_writer varchar2(60),
  content varchar2(4000)
) ;
create table s_shopcart_item(
	id number primary key,
	user_id number references s_user(id),
	product_id number references s_product(id),
	num number
);
create table s_reduce(
	id number primary key,
	user_id number references s_user(id),
	product_id number references s_product(id),
	baseprice number
);

--序列，oracle提供的解决主键自增用，等价与
--mysql中的auto_increment
create sequence my_seq;


insert into s_cate(id,name) values(1,'文学类');
insert into s_cate(id,name) values(2,'教育类');
insert into s_cate(id,name) values(3,'计算机类');
insert into s_cate(id,name) values(4,'儿童类');
insert into s_cate(id,name) values(5,'漫画类');
insert into s_cate(id,name) values(6,'工具类');
insert into s_cate(id,name) values(7,'期刊类');

insert into s_cate_detail(id,name,category_id) values(1,'校园文学',1);
insert into s_cate_detail(id,name,category_id) values(2,'纪实文学',1);
insert into s_cate_detail(id,name,category_id) values(3,'职业技术培训教材',2);
insert into s_cate_detail(id,name,category_id) values(4,'注册会计师',2);
insert into s_cate_detail(id,name,category_id) values(5,'研究生/本科/专科教材',2);
insert into s_cate_detail(id,name,category_id) values(6,'数据库',3);
insert into s_cate_detail(id,name,category_id) values(7,'编程语言',3);
insert into s_cate_detail(id,name,category_id) values(8,'算法',3);
insert into s_cate_detail(id,name,category_id) values(9,'故事书',4);
insert into s_cate_detail(id,name,category_id) values(10,'国内漫画',5);
insert into s_cate_detail(id,name,category_id) values(11,'国外漫画',5);
insert into s_cate_detail(id,name,category_id) values(12,'驾驶工具书',6);



insert into s_price_scope(id,min,max) values(1,1,100);
insert into s_price_scope(id,min,max) values(2,101,200);
insert into s_price_scope(id,min,max) values(3,201,300);
insert into s_price_scope(id,min,max) values(4,301,400);

create table s_product (
 id number primary key,
 name varchar2(60),
 price number,
 publish varchar2(60),
 img varchar2(1000),
 parameter varchar2(2400),
 introduction varchar2(3600),
 wraplist varchar2(2400),
 hot number,
 remain number,
 sellnum number,
 clickrate number,
 publishdate date ,
 cate_detail_id number references s_cate_detail (id) on delete cascade
);
insert into s_product(id,name,price,publish,img,publishdate,cate_detail_id) values(1,'草原帝国',100,'南京出版社','upload/c66f7019e93746c1b98da6421f27d088.jpg#upload/c66f7019e93746c1b98da6421f27d088.jpg','08-6月-18',1);
insert into s_product(id,name,price,publish,img,publishdate,cate_detail_id) values(2,'java入门',70,'清华出版社','upload/6c53626c6a5a41fda4990c2e552cd416.jpg#upload/6c53626c6a5a41fda4990c2e552cd416.jpg','07-6月-18',8);
insert into s_product(id,name,price,publish,img,publishdate,cate_detail_id) values(3,'android开发',80,'清华出版社','upload/903d4092f8e24f4f9c8b56a18a8f1cac.jpg#upload/903d4092f8e24f4f9c8b56a18a8f1cac.jpg','05-6月-18',8);


--新增书的热度和库存
update s_product set hot=0,remain=1000 where id=1;
update s_product set hot=0,remain=900 where id=2;
update s_product set hot=0,remain=600 where id=3;
delete from s_product where id=4;
delete from s_product where id=5;
delete from s_product where id=6;
--主页展示书的模拟
insert into s_product(id,name,price,publish,img,hot,remain,publishdate,cate_detail_id) values(4,'java从入门到精通',99,'电子工业出版社','upload/p01.png#upload/p01.png',2,1000,'12-7月-18',7);
insert into s_product(id,name,price,publish,img,hot,remain,publishdate,cate_detail_id) values(5,'java从入门到精通1',96,'人民出版社','upload/p01.png#upload/p01.png',2,1000,'12-7月-18',7);
insert into s_product(id,name,price,publish,img,hot,remain,publishdate,cate_detail_id) values(6,'java从入门到精通2',109,'中央编译出版社','upload/p01.png#upload/p01.png',2,1000,'12-7月-18',7);
update s_product  set img='upload/p01.png,upload/viewBook.png#upload/p01.png,upload/viewBook.png' where id=5;
update s_product  set introduction='这是一本入门的java学习的好书#upload/p01.png,upload/viewBook.png' where id=5;
create table s_report (
  id number primary key,
  name varchar2(60),
  rank number,
  publish_date date,
  department varchar2(60),
  publish_writer varchar2(60),
  content varchar2(4000)
) ;
--简报的模拟
insert into s_report values(1,'致年轻的你',2,'12-7月-18','WEB与云计算研发部','huzl','七月飞扬着你火热的青春;七月镌刻着你真心的友谊;七月收获着你灿烂的笑容;七月装点着你美好的未来<br>
　　不要说一天的时间无足轻重，人生的漫长岁月就由这一天一天连接而成;愿你珍惜生命征途上的每一个一天，让每天都朝气蓬勃地向前进。<br>
　　静静的我们即将分离，诚诚的祝福向你传送，久久阔别的日子，愿你生活很开心，有情终眷属，学习步步高。坚信自己是颗星，穿云破雾亮晶晶。坚信自己是燧石，不怕敲打和曲折，坚信自己是人才，驱散浮云与阴霾。<br>
　　愿你是一棵树：春天，吐一山淡淡的香味;夏天，洒一抹如泉的凉荫;秋天，举一树甜甜的青果;冬天，做一个养精蓄锐的好梦!<br>
　　嫩绿的叶芽说：生长!生长!洁白的花朵说：开放!开放!深红的果实说：辉煌!辉煌!在人生的旅途中，望你写好这“欢乐三部曲”。<br>
　　你长着一对翅膀。坚韧地飞吧，不要为风雨所折服;诚挚地飞吧，不要为香甜的蜜汁所陶醉。朝着明确的目标，飞向美好的人生。<br>
　　当你孤独时，风儿就是我的歌声，愿它能使你得到片刻的安慰;当你骄傲时，雨点就是我的警钟，愿它能使你获得永恒的谦逊。<br>');
insert into s_report values(2,'相信这一切对我们都是最好的安排',5,'18-6月-18','杰普软件科技','系统管理员','据报道，每年七月份为杰普火热的招生季节，大批的学生涌入杰普，原本平静的浦东软件园瞬间变得火热！整个软件园充满着青春的气息，正值青春年华的男孩和女孩们，每天穿梭在软件园的每一个角落，他们的笑容，他们认真思考的表情，紧皱的眉头，都让他们的青春更加大放异彩！据报道，每年七月份为杰普火热的招生季节，大批的学生涌入杰普，原本平静的浦东软件园瞬间变得火热！整个软件园充满着青春的气息，正值青春年华的男孩和女孩们，每天穿梭在软件园的每一个角落，他们的笑容，他们认真思考的表情，紧皱的眉头，都让他们的青春更加大放异彩！据报道，每年七月份为杰普火热的招生季节，大批的学生涌入杰普，原本平静的浦东软件园瞬间变得火热！整个软件园充满着青春的气息，正值青春年华的男孩和女孩们，每天穿梭在软件园的每一个角落，他们的笑容，他们认真思考的表情，紧皱的眉头，都让他们的青春更加大放异彩！据报道，每年七月份为杰普火热的招生季节，大批的学生涌入杰普，原本平静的浦东软件园瞬间变得火热！整个软件园充满着青春的气息，正值青春年华的男孩和女孩们，每天穿梭在软件园的每一个角落，他们的笑容，他们认真思考的表情，紧皱的眉头，都让他们的青春更加大放异彩！据报道，每年七月份为杰普火热的招生季节，大批的学生涌入杰普，原本平静的浦东软件园瞬间变得火热！整个软件园充满着青春的气息，正值青春年华的男孩和女孩们，每天穿梭在软件园的每一个角落，他们的笑容，他们认真思考的表情，紧皱的眉头，都让他们的青春更加大放异彩！');


















