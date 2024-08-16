package entity

import "gorm.io/gorm"

type CurrentAddress struct {
    gorm.Model
    House_No		string
    Village_No		string
    Alley			string
    Road			string
    Sub_District	string
    District		string
    province		string
	post_code		string
}