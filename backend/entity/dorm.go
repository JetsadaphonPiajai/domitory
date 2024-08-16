package entity

import "gorm.io/gorm"

type Dorm struct {
	gorm.Model
	Type        string
	Dorm_Gender string
	// 1 หอพัก มีได้หลายห้อง
	Rooms []Room `gorm:"foreignKey:Dorm_ID"`
	// 1 dorm เป็นเจ้าของได้หลาย RentFees
	RentFees []RentFee `gorm:"foreignKey:DormID"`
	// 1 dorm เป็นเจ้าของได้หลาย WaterFees
	WaterFees []WaterFee `gorm:"foreignKey:DormID"`
}
