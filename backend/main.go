package main

import (
	"github.com/domitory/backend/entity"
	"gorm.io/driver/sqlite"
	"gorm.io/gorm"
)

func main() {
	db, err := gorm.Open(sqlite.Open("domitory"), &gorm.Config{})
	if err != nil {
		panic("failed to connect database")
	}
	// Migrate the schema
	db.AutoMigrate(&entity.Admin{}, &entity.Announcement{}, &entity.CurrentAddress{}, &entity.DelayedPaymentForm{}, &entity.Dorm{}, &entity.ElectricityFee{}, &entity.En_ExitingForm{}, &entity.Expense{},
		&entity.RentFee{}, &entity.Repairing{}, &entity.ResigningForm{}, &entity.Room{}, &entity.Slip{}, &entity.Student{}, &entity.WaterFee{})
}
