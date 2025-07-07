package main

import (
	"fmt"
	"time"
)

func main() {
	// Get current time
	now := time.Now()

	// Format: abbreviated weekday, month, day, year
	fmt.Println(now.Format("Mon, Jan 02, 06"))
}
