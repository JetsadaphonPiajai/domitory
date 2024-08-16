package entity

import (
    "time"
    "gorm.io/gorm"
)

type En_ExitingForm struct {
    gorm.Model
    Name			string
	Date_Submission	time.Time
	request			string
    Because_Of		string
	Date_Reques		time.Time
    Status			string

    // StudentID ทำหน้าที่เป็น FK
    Student_ID	uint
    Student		Student `gorm:"foreignKey:Student_ID"`

    // AdminID ทำหน้าที่เป็น FK
    Admin_ID	uint
    Admin		Admin `gorm:"foreignKey:Admin_ID"`

}