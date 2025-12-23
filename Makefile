ICONS := $(shell ls *_light_transparent_1024w.png | sed 's/_light_transparent_1024w.png//')

all: $(ICONS)

$(ICONS):
	@echo "▶ Generating favicon for $@"
	@./scripts/generate-favicon.sh $@

.PHONY: all

