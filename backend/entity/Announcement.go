package entity

import (
	"time"

	"gorm.io/gorm"
)

type Announcement struct {
	gorm.Model
	Title   string
	Date    time.Time
	AdminID *uint
	Admin   Admin `gorm:"foriengKey:AdminID"`
}
