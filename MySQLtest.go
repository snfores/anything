package main

import (
	"database/sql"
	"fmt"
	"log"

	_ "github.com/go-sql-driver/mysql"
)

//Newmenu is struct
type Newmenu struct {
	id         int
	name       string
	price      int
	starttime  string
	lastupdate string
}

//NewMysql is struct
type NewMysql struct {
	tablename string
	address   string
	protocol  string
	dbname    string
	user      string
	pass      string
}

func main() {

	val := Newmenu{name: "タバスコいりカクテル", price: 800, starttime: "2015-3-20"}
	opt := NewMysql{tablename: "menu", dbname: "nyumon", user: "nyuser", pass: "nypass"}

	//今回はlocalhostなのでuser名:password@/db名でOK
	db, err := sql.Open("mysql", opt.user+":"+opt.pass+"@/"+opt.dbname) //opt.user+":"+opt.pass+"@"+opt.protocol+"("+opt.address+")/"+opt.db
	log.Println("Connected to mysql.")

	if err != nil {
		log.Fatal(err)
	}
	//上のerrより下のif errの方がいいらしい
	err = db.Ping()
	if err != nil {
		panic(err)
	}
	defer db.Close()

	//INSERT
	S := fmt.Sprintf("INSERT INTO %s (name,price,start_date) VALUES(?, ?, ?);", opt.tablename)
	ins, err := db.Prepare(S)
	if err != nil {
		log.Fatal(err)
	}
	defer ins.Close()
	ins.Exec(val.name, val.price, val.starttime)

	//SELECT
	rows, err := db.Query("SELECT * FROM " + opt.tablename + ";")
	defer rows.Close()
	if err != nil {
		log.Fatal(err)
	}

	var allresult []Newmenu
	for rows.Next() {
		returnmenu := Newmenu{}
		err := rows.Scan(&returnmenu.id, &returnmenu.name, &returnmenu.price, &returnmenu.starttime, &returnmenu.lastupdate)
		if err != nil {
			log.Fatal(err)
		}
		allresult = append(allresult, returnmenu)
	}

	for _, u := range allresult {
		fmt.Printf("ID:%d name:%s price:%d start_date:%s lastupdate:%s\n", u.id, u.name, u.price, u.starttime, u.lastupdate)
	}

}
