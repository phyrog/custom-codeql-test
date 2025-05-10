package core

import (
	"errors"
	"fmt"
)

func DoSomething() {
	fmt.Print("Hello\n")
}

func ReturnSomething(in string) error {
	if len(in) > 3 {
		return errors.New("string is too long")
	}
	return nil
}
