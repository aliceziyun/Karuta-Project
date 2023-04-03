package util

import (
	"database/sql"
	_ "github.com/go-sql-driver/mysql"
	"log"
)

var (
	Db  *sql.DB
	err error
)

func init() {
	Db, err = sql.Open("mysql", "root:123456@tcp(localhost:3306)/karuta")
	if err != nil {
		log.Fatal(err)
	}
}
