# docker 

запуск mysql

```
$ docker run -d -e MYSQL_ROOT_PASSWORD=secret -e MYSQL_DATABASE=todos -p3306:3306 mysql:8.0
ecbf7b6bf3c3bb975703f6268ca1efe8b7f456d9e9e0e4e9e5d014d6306e5719
```

запуск консольного клиента внутри образа

```
$ docker ps

```
берем container id или name
```
$ docker exec -it mystifying_lehmann mysql -u root -p
```


# migrate install

```
$ go install -tags 'mysql' github.com/golang-migrate/migrate/v4/cmd/migrate@latest
```

# migrate up 
```
$ migrate -database "mysql://root:secret@tcp(localhost:3306)/noolingo" -source file://migrations/mysql up
1/u user_table (76.505912ms)
```

# migrate down 
```
$ migrate -database "mysql://root:secret@tcp(localhost:3306)/noolingo" -source file://migrations/mysql down -all
1/d user_table (53.147539ms)
```

# migrate failover ([#] is a last succeded migration)
```
$ migrate -database "mysql://root:secret@tcp(localhost:3306)/noolingo" -source file://migrations/mysql force [#]
```

# current version

```
migrate -database "mysql://root:secret@tcp(localhost:3306)/noolingo" -source file://migrations/mysql version
1
```