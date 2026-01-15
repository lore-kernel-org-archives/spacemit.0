Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B036256D;
	Thu, 15 Jan 2026 00:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768435819; cv=none; b=s6qAX/ajGAUZT2nxFAKkGgJJJygG0mTR9QcOYKTkFUZMh92lG9eozahtJIE6Pp9CczX/Pt5Mqg2C9hglaphwgGekOK6nTlOYpDCNEL5pxC623MGJV+WsXyfjNpgHTkifPhVtEDQkRtJ1bWRUJKU8/Cru/0JIcFJKpiaE4P5wrio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768435819; c=relaxed/simple;
	bh=Ljq6Ev0VUg/ATfRNcevTlJY9Y7DmUPF+pSGl3zMERsM=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=nIsW5nZpJOanEJZBZhtqIR/LnLQNJYAAhkTif7qTQ0tp6+9ooQl5bCociqpT1gGy3sKXl9hVjkjzUHIjw9jVWwaTe3KzL+iLU+Xuj+UH8WQegpybzgFSLilftkxVg7YEzJCw+88nF4OOqKVxYqQzLrGQkoC+ftbTYLfmZG0kNeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fdxvhVmg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fdxvhVmg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA41BC4CEF7;
	Thu, 15 Jan 2026 00:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768435819;
	bh=Ljq6Ev0VUg/ATfRNcevTlJY9Y7DmUPF+pSGl3zMERsM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=fdxvhVmgH7t0NVfxCuVG+vg+FymTORumEusFnBforAlYl+P3hnT9yqLNlRZsFMOxc
	 v3H3ocYBGnsOr7zTmBl7nx2Rd5fM9rWVIjcqxqNl4MpZBGXlQnS8ZIXEqKoQQA/lh5
	 5jBABtjkfgJoStX8ElTEdd7sTNmhmFsyqaR3TkyDixyU2mrFzY7NNTjkVTEUWQF+Bm
	 dQStxJ2ezwVQWZqOoGQVGslxj7GCorF0SRKLWDXxyogzRAz5/e8R/1oZ7A4Vrg1gPq
	 kdJhffdkwhlexCUB932WeIpKRXJZD9BHZ3dEpXGk6FvPCcqEivYmXn0yBaSSEIcBXA
	 TYl7+oTaBROAg==
Date: Wed, 14 Jan 2026 17:10:16 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: Guodong Xu <guodong@riscstar.com>
cc: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <pjw@kernel.org>, 
    Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
    Alexandre Ghiti <alex@ghiti.fr>, Conor Dooley <conor.dooley@microchip.com>, 
    Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
    Krzysztof Kozlowski <krzk+dt@kernel.org>, 
    Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
    Yixun Lan <dlan@gentoo.org>, Conor Dooley <conor+dt@kernel.org>, 
    Junhui Liu <junhui.liu@pigmoral.tech>, linux-doc@vger.kernel.org, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
    devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
    spacemit@lists.linux.dev
Subject: Re: [PATCH v2 1/4] Documentation: riscv: uabi: Clarify ISA spec
 version for canonical order
In-Reply-To: <20260115-adding-b-dtsi-v2-1-254dd61cf947@riscstar.com>
Message-ID: <e91054c8-d7fc-5b0f-2821-9926561f64d5@kernel.org>
References: <20260115-adding-b-dtsi-v2-0-254dd61cf947@riscstar.com> <20260115-adding-b-dtsi-v2-1-254dd61cf947@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 15 Jan 2026, Guodong Xu wrote:

> Specify that chapter 27 refers to version 20191213 of the RISC-V ISA
> Unprivileged Architecture. The chapter numbering differs across
> specification versions - for example, in version 20250508, the ISA
> Extension Naming Conventions is chapter 36, not chapter 27.
> 
> Historical versions of the RISC-V specification can be found via Link [1].
> 
> Acked-by: Paul Walmsley <pjw@kernel.org>
> Link: https://riscv.org/specifications/ratified/ [1]
> Fixes: f07b2b3f9d47 ("Documentation: riscv: add a section about ISA string ordering in /proc/cpuinfo")
> Signed-off-by: Guodong Xu <guodong@riscstar.com>

Thanks, queued for v6.19-rc fixes.


- Paul
