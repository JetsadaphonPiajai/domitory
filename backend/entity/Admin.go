package entity

import (
	"time"

	"gorm.io/gorm"
)

type Admin struct {
	gorm.Model
	Firstname           string
	Lastname            string
	BirthDay            time.Time
	Password            string
	PhonNumber          string
	Repairings          []Repairing          `gorm:"foreignKey:Admin_ID"`
	DelayedPaymentForms []DelayedPaymentForm `gorm:"foreignKey:Admin_ID"`
	En_ExitingForms     []En_ExitingForm     `gorm:"foreignKey:Admin_ID"`
	ResigningForms      []ResigningForm      `gorm:"foreignKey:Admin_ID"`
	Slips               []Slip               `gorm:"foreignKey:Admin_ID"`
	Announcement        []Announcement       `gorm:"foreignKey:Admin_ID"`
}
