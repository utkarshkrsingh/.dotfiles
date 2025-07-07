package main

import (
	"fmt"
	"time"
)

func main() {
	// Get current time
	now := time.Now()

	// Format: hour (1-12, no leading 0), minute (with leading 0), AM/PM
	fmt.Println(now.Format("3:04 PM"))
}
