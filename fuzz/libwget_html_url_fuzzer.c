/*
 * Copyright (c) 2017-2021 Free Software Foundation, Inc.
 *
 * This file is part of libwget.
 *
 * Libwget is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * Libwget is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with libwget.  If not, see <https://www.gnu.org/licenses/>.
 */

#include <config.h>

#include <assert.h>
#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>

#include "wget.h"
#include "fuzzer.h"

int LLVMFuzzerTestOneInput(const uint8_t *data, size_t size)
{
	if (size > 10000) // same as max_len = 10000 in .options file
		return 0;

	char *in = (char *) malloc(size + 2);
	assert(in != NULL);

	// 0 terminate
	memcpy(in, data, size);
	in[size] = in[size + 1] = 0;

	wget_html_parsed_result *res = wget_html_get_urls_inline(in, NULL, NULL);
	wget_html_free_urls_inline(&res);

	free(in);

	return 0;
}
