# Makefile for sa_processing_element synthesis
# Uses Synopsys Design Compiler

DESIGN = sa_processing_element
SCRIPT_DIR = script
CONS_DIR = cons
RPT_DIR = rpt
OUTPUT_DIR = output

# Default target
.PHONY: all
all: synth

# Synthesis target
.PHONY: synth
synth:
	@echo "========================================="
	@echo "Synthesizing $(DESIGN)..."
	@echo "========================================="
	@mkdir -p $(RPT_DIR) $(OUTPUT_DIR) work
	dc_shell -f $(SCRIPT_DIR)/synth_sa_pe.tcl | tee synthesis.log
	@echo ""
	@echo "Synthesis complete. Check reports in $(RPT_DIR)/"

# Quick synthesis (no detailed reports)
.PHONY: quick
quick:
	@mkdir -p $(RPT_DIR) $(OUTPUT_DIR) work
	dc_shell -f $(SCRIPT_DIR)/synth_sa_pe.tcl

# Clean build artifacts
.PHONY: clean
clean:
	@echo "Cleaning synthesis artifacts..."
	rm -rf $(OUTPUT_DIR)/*.v $(OUTPUT_DIR)/*.ddc $(OUTPUT_DIR)/*.sdc $(OUTPUT_DIR)/*.sdf
	rm -rf $(RPT_DIR)/*.rpt
	rm -rf work
	rm -f *.svf *.log command.log
	rm -rf alib-52
	@echo "Clean complete."

# Clean everything including reports
.PHONY: cleanall
cleanall: clean
	rm -rf $(RPT_DIR) $(OUTPUT_DIR) work
	rm -rf nangate15 pdk/*/work
	@echo "All generated files removed."

# View area report
.PHONY: area
area:
	@if [ -f $(RPT_DIR)/sa_pe_8_report_area.rpt ]; then \
		cat $(RPT_DIR)/sa_pe_8_report_area.rpt; \
	else \
		echo "Area report not found. Run 'make synth' first."; \
	fi

# View timing report
.PHONY: timing
timing:
	@if [ -f $(RPT_DIR)/sa_pe_7_report_timing.rpt ]; then \
		cat $(RPT_DIR)/sa_pe_7_report_timing.rpt; \
	else \
		echo "Timing report not found. Run 'make synth' first."; \
	fi

# View power report
.PHONY: power
power:
	@if [ -f $(RPT_DIR)/sa_pe_9_report_power.rpt ]; then \
		cat $(RPT_DIR)/sa_pe_9_report_power.rpt; \
	else \
		echo "Power report not found. Run 'make synth' first."; \
	fi

# View QoR summary
.PHONY: qor
qor:
	@if [ -f $(RPT_DIR)/sa_pe_10_report_qor.rpt ]; then \
		cat $(RPT_DIR)/sa_pe_10_report_qor.rpt; \
	else \
		echo "QoR report not found. Run 'make synth' first."; \
	fi

# View all key reports
.PHONY: reports
reports:
	@echo "========================================="
	@echo "QoR Summary:"
	@echo "========================================="
	@make qor
	@echo ""
	@echo "========================================="
	@echo "Area Summary:"
	@echo "========================================="
	@make area | head -30
	@echo ""
	@echo "========================================="
	@echo "Timing Summary:"
	@echo "========================================="
	@make timing | head -30

# Help
.PHONY: help
help:
	@echo "Makefile for $(DESIGN) synthesis"
	@echo ""
	@echo "Targets:"
	@echo "  make synth     - Run full synthesis"
	@echo "  make quick     - Quick synthesis (less verbose)"
	@echo "  make clean     - Remove synthesis outputs"
	@echo "  make cleanall  - Remove all generated files"
	@echo "  make area      - View area report"
	@echo "  make timing    - View timing report"
	@echo "  make power     - View power report"
	@echo "  make qor       - View QoR summary"
	@echo "  make reports   - View key reports summary"
	@echo "  make help      - Show this help message"
	@echo ""
	@echo "Reports location: $(RPT_DIR)/"
	@echo "Outputs location: $(OUTPUT_DIR)/"
