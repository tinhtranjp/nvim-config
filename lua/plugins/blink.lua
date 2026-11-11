return {
	"saghen/blink.cmp",
	version = "1.*",
	opts = {
		keymap = {
			preset = "super-tab",
			["<C-Space>"] = { "show" },
		},
		completion = {
			list = {
				selection = {
					preselect = true,
					auto_insert = true,
				},
			},
			menu = {
				draw = {
					columns = {
						{ "kind_icon" },
						-- 建议将 label_description 放在 label 旁边，方便对比
						{ "label", "label_description", gap = 1 },
						{ "source_name" },
					},
					components = {
						-- 当你看到有些项描述为空时，尝试显示 LSP 提供的 detail 字段
						label_description = {
							text = function(ctx)
								return ctx.label_description ~= "" and ctx.label_description or ctx.item.detail
							end,
						},
					},
				},
			},
		},
		sources = {
			default = { "lsp", "path", "buffer" },
		},
		fuzzy = {
			implementation = "prefer_rust_with_warning",
		},
	},
}
