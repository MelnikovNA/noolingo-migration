all: 
	migrate -source file://migrations/mysql \
	-database "${MYSQL_DSN}" up

all-docker: 
	sleep 10
	./.bin/migrate -source file:///app/migrations/mysql -database "${MYSQL_DSN}" up

all-kube: all-docker
	sleep infinity && wait

# make NAME="test" create  - создание файлов миграции
create: 
	migrate create -dir migrations/mysql -ext sql ${NAME}
	# -database "mysql://${MYSQL_USER}:${MYSQL_PASS}@tcp(localhost:3306)/${MYSQL_DB}"

migrate:	
	go install -tags 'mysql' github.com/golang-migrate/migrate/v4/cmd/migrate@latest

