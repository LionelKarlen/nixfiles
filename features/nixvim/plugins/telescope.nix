{
	programs.nixvim = {
		plugins.telescope = {
			enable=true;
			extensions = {
				fzf-native.enable=true;
				ui-select.enable=true;
			};
			keymaps = {
			"<leader>fs"={
					mode="n";
					action="current_buffer_fuzzy_find";
					options={
						desc="[S]earch in [f]ile buffer";
					};
				};
			};
		};
		keymaps=[
			{
				mode="n";
				key="<leader>fl";
				action.__raw=''
					function()
						require('telescope.builtin').buffers(
							require('telescope.themes').get_dropdown {
								winblend=1,
								previewer=false
							}
						)
					end
				'';
				options={
					desc="[L]ist [f]ile buffers";
				};
			}
			{
				mode="n";
				key="<leader>fo";
				action.__raw=''
					function()
						require('telescope.builtin').find_files(
							require('telescope.themes').get_dropdown {
								winblend=10,
								previewer=true
							}
						)
					end
				'';
				options={
					desc="[O]pen [f]ile";
				};
			}
		];
	};
}
