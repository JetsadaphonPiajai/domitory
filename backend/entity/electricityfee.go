package entity

import "gorm.io/gorm"

type ElectricityFee struct {
	gorm.Model
	Amount float64
	// RoomID ทำหน้าที่เป็น FK
	RoomID *uint
	Rooms  Room `gorm:"foreignKey:RoomID"`
	// 1 ElectricityFee เป็นเจ้าของได้หลาย Expenses
	Expenses []Expense `gorm:"foreignKey:ElecFee_ID"`
}
