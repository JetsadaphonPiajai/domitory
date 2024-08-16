package entity

import (
	"time"

	"gorm.io/gorm"
)

type Expense struct {
	gorm.Model
	Date   time.Time
	Remark string
	// RentFeeID ทำหน้าที่เป็น FK
	RentFeeID *uint
	RentFees  RentFee `gorm:"foreignKey:RentFeeID"`
	// ElecFeeID ทำหน้าที่เป็น FK
	ElecFeeID       *uint
	ElectricityFees ElectricityFee `gorm:"foreignKey:ElecFeeID"`
	//  WaterID ทำหน้าที่เป็น FK
	WaterID   *uint
	WaterFees WaterFee `gorm:"foreignKey:WaterID"`
	// SlipID ทำหน้าที่เป็น FK
	SlipID *uint
	Slips  Slip `gorm:"foreignKey:SlipID"`
}
