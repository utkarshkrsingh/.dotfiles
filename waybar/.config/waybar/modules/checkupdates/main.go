package main

import (
	"bytes"
	"fmt"
	"os/exec"
	"strings"
)

func countLines(cmd string, args ...string) int {
	command := exec.Command(cmd, args...)
	var out bytes.Buffer
	command.Stdout = &out
	command.Stderr = nil

	err := command.Run()
	if err != nil {
		// Fails silently like `2>/dev/null` in bash
		return 0
	}

	lines := strings.Split(strings.TrimSpace(out.String()), "\n")
	if len(lines) == 1 && lines[0] == "" {
		return 0
	}
	return len(lines)
}

func main() {
	pacmanUpdates := countLines("checkupdates")
	aurUpdates := countLines("paru", "-Qua")
	totalUpdates := pacmanUpdates + aurUpdates

	switch totalUpdates {
	case 1:
		fmt.Print("󰇚 1 Update")
	case 0:
		// No output, matching Bash behavior
	default:
		fmt.Printf("󰇚 %d Updates", totalUpdates)
	}
}
