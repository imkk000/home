package main

import (
	"fmt"
	"os"
	"strings"

	"github.com/goccy/go-yaml"
	"github.com/rs/zerolog/log"
	"golang.org/x/text/cases"
	"golang.org/x/text/language"
)

const input = "words.yaml"

func main() {
	fs, err := os.Open(input)
	if err != nil {
		log.Fatal().Err(err).Msg("open file")
	}
	defer fs.Close()

	var cfg Config
	if err := yaml.NewDecoder(fs).Decode(&cfg); err != nil {
		log.Fatal().Err(err).Msg("decode yaml")
	}
	upper := cases.Upper(language.English)
	caser := cases.Title(language.English)

	var c int
	var sb strings.Builder
	for _, word := range cfg.Words {
		c += 2
		sb.WriteString(word + "\n")
		sb.WriteString(caser.String(word) + "\n")
	}
	for _, abbr := range cfg.Abbreviations {
		c += 3
		sb.WriteString(abbr + "\n")
		sb.WriteString(caser.String(abbr) + "\n")
		sb.WriteString(upper.String(abbr) + "\n")
	}
	log.Print(os.WriteFile(nvimOutput, []byte(sb.String()), 0644))

	content := fmt.Sprintf(aspellHeader, c) + "\n" + sb.String()
	log.Print(os.WriteFile(aspellOutput, []byte(content), 0644))
}

type Config struct {
	Words         []string
	Abbreviations []string
}

const (
	aspellHeader = `personal_ws-1.1 en %d`
	aspellOutput = "aspell.en.pws"
)

const (
	nvimOutput = "neovim.spell"
)
