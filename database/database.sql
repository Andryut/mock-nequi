
--CODE TRANSACT-SQL

create database [mock-nequi];
go
use [mock-nequ];
go
create table users(
	id bigint identity primary key,
	name varchar(100) not null,
	email varchar(100) unique not null,
	salt int not null,
	password varchar(256) not null
);
go
CREATE INDEX index_users_email ON users (email); 
go
create table accounts(
	id bigint identity primary key,
	owner bigint references users on delete cascade not null,
	name varchar(100) not null,
	type varchar(20) default 'general' not null,
	amount_money money default 0 not null,
	active bit default 1 not null,

	unique(owner, type, name)
);
go
CREATE INDEX index_accounts_owner ON accounts (owner); 
go
CREATE INDEX index_accounts_type ON accounts (type); 
go
create table movements(
	id bigint identity primary key,
	transmitter_account bigint default 1 references accounts on delete set default not null,
	type varchar(20) default 'operation' not null,
	amount_money money not null,
	date datetime default getdate() not null,

	check(amount_money>0)
);
go
CREATE INDEX index_movements_transmitter_account ON movements (transmitter_account); 
go
CREATE INDEX index_movements_type ON movements (type); 
go
create table transactions(
	id bigint identity primary key,
	associated_movement bigint references movements on delete cascade not null,
	type varchar(50) default 'transaction' not null
);
go
CREATE INDEX index_transactions_associated_movement ON transactions (associated_movement); 
go
CREATE INDEX index_transactions_type ON transactions (type); 
go
create table transfers(
	id bigint identity primary key,
	associated_movement bigint references movements on delete cascade not null,
	receiver bigint default 1 references users on delete set default not null
);
go
CREATE INDEX index_receiver_associated_movement ON transfers (associated_movement); 
go
CREATE INDEX index_receiver_receiver ON transfers (receiver); 
go
create table coffers(
	id bigint identity primary key,
	owner bigint references users on delete cascade not null,
	name varchar(100) not null,
	type varchar(20) default 'mattress' not null,
	amount_money money default 0 not null,
	active bit default 1 not null,

	unique (owner, name, type)
);
go
CREATE INDEX index_coffers_owner ON coffers (owner); 
go
CREATE INDEX index_acoffers_type ON coffers (type); 
go
create table goals(
	id bigint identity primary key,
	coffer bigint references coffers on delete cascade not null,
	total_amount money not null,
	deadline date not null
);
go
CREATE INDEX index_goals_coffer ON goals (coffer); 
go

--default data
insert users values ('deleted-user', '', '', 0)
insert accounts (owner, name) values (1, 'deleted-account')
