package entity

import (
	"gorm.io/gorm"
)

type WaterFee struct {
	gorm.Model
	Amount float64

	// CreatorID ทำหน้าที่เป็น FK
	DormID *uint
	Dorms  Dorm `gorm:"foreignKey:DormID"`

	// 1 WaterFee เป็นเจ้าของได้หลาย Expenses
	Expenses []Expense `gorm:"foreignKey:WaterID"`
}
