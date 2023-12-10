MYSQL_USER?=root
MYSQL_PASS?=secret
MYSQL_DB?=noolingo



all: 
	migrate -source file://migrations/mysql \
	-database "mysql://${MYSQL_USER}:${MYSQL_PASS}@tcp(localhost:3306)/${MYSQL_DB}" up

# make NAME="test" create  - создание файлов миграции
create: 
	migrate create -dir migrations/mysql -ext sql ${NAME}
	# -database "mysql://${MYSQL_USER}:${MYSQL_PASS}@tcp(localhost:3306)/${MYSQL_DB}"

migrate:	
	go install -tags 'mysql' github.com/golang-migrate/migrate/v4/cmd/migrate@latest

