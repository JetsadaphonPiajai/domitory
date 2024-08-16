package entity

import (
	"time"

	"gorm.io/gorm"
)

type Slip struct {
	gorm.Model
	Path   string
	Date   time.Time
	Status string

	// StudentID ทำหน้าที่เป็น FK
	Student_ID uint
	Students  Student `gorm:"foreignKey:StudentID"`

	// AdminID ทำหน้าที่เป็น FK
	Admin_ID uint
	Admins  Admin `gorm:"foreignKey:Admin_ID"`

	// 1 Slip เป็นเจ้าของได้หลาย Expenses
	Expenses []Expense `gorm:"foreignKey:SlipID"`
}
