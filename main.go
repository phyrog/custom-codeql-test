package main

import (
	"fmt"
	"log/slog"

	"github.com/phyrog/custom-codeql-test/pkg/core"
)

func main() {
	fmt.Println("Hello world")
	slog.Info("Hello world")
	core.DoSomething()
	err := core.ReturnSomething("foo")
	slog.Error(err.Error())
}
