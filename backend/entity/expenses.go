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
	RentFee_ID *uint
	RentFees  RentFee `gorm:"foreignKey:RentFee_ID"`
	// ElecFeeID ทำหน้าที่เป็น FK
	ElecFee_ID       *uint
	ElectricityFees ElectricityFee `gorm:"foreignKey:ElecFee_ID"`
	//  WaterID ทำหน้าที่เป็น FK
	Water_ID   *uint
	WaterFees WaterFee `gorm:"foreignKey:Water_ID"`
	// SlipID ทำหน้าที่เป็น FK
	SlipID *uint
	Slips  Slip `gorm:"foreignKey:SlipID"`
}
