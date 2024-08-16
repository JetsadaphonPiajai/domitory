package entity

import (
    "time"
    "gorm.io/gorm"
)

type DelayedPaymentForm struct {
    gorm.Model
    Name				string
    Dorm_Payment		float64
    Electricly_Bill		float64
    Water_Bill			float64
    Because_Of			string
	Due_Date			time.Time
    Status				string

    // StudentID ทำหน้าที่เป็น FK
    Student_ID	uint
    Student		Student `gorm:"foreignKey:Student_ID"`

    // AdminID ทำหน้าที่เป็น FK
    Admin_ID	uint
    Admin		Admin `gorm:"foreignKey:Admin_ID"`
}