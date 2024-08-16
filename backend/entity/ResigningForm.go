package entity

import (
    "time"
    "gorm.io/gorm"
)

type ResigningForm struct {
    gorm.Model
    Name			string
	Date			time.Time
    Because_Of		string
	Accommodation	string
    Phone_Number	string
    Status			string

    // StudentID ทำหน้าที่เป็น FK
    Student_ID	uint
    Student		Student `gorm:"foreignKey:Student_ID"`

    // AdminID ทำหน้าที่เป็น FK
    Admin_ID	uint
    Admin		Admin `gorm:"foreignKey:Admin_ID"`

	// CurrentAddressID ทำหน้าที่เป็น FK
	CurrentAddress_ID	uint
	CurrentAddress      CurrentAddress `gorm:"foreignKey:CurrentAddress_ID"`
}