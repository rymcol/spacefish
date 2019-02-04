#
# Swift
#
# Swift Swift makes it easy to write software that is incredibly fast and safe by design.
# Link: https://swift.org

function __sf_section_swift -d "Display the current swift version if you are inside a path that contains a swift package"
	# ------------------------------------------------------------------------------
	# Configuration
	# ------------------------------------------------------------------------------

	__sf_util_set_default SPACEFISH_SWIFT_SHOW true
	__sf_util_set_default SPACEFISH_SWIFT_PREFIX $SPACEFISH_PROMPT_DEFAULT_PREFIX
	__sf_util_set_default SPACEFISH_SWIFT_SUFFIX $SPACEFISH_PROMPT_DEFAULT_SUFFIX
	__sf_util_set_default SPACEFISH_SWIFT_SYMBOL "🐦 "
	__sf_util_set_default SPACEFISH_SWIFT_COLOR yellow

	# ------------------------------------------------------------------------------
	# Section
	# ------------------------------------------------------------------------------

	# Show the current version?
	[ $SPACEFISH_SWIFT_SHOW = false ]; and return

	# Ensure the swift is installed
	type -q swift; or return

	# Ensure the swiftenv command is available
	type -q swiftenv; or return

	if not test -f Package.swift
		return
	end

	set swift_version (string sub -s 1 (swiftenv version | string split ' ')[1])

	__sf_lib_section \
		$SPACEFISH_SWIFT_COLOR \
		$SPACEFISH_SWIFT_PREFIX \
		"$SPACEFISH_SWIFT_SYMBOL""$swift_version" \
		$SPACEFISH_SWIFT_SUFFIX
end
