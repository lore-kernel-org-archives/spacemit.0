Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 724DD3546F2;
	Wed, 19 Nov 2025 16:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763569051; cv=none; b=VIAX1gRrefBNh9VcA7s+yBPigEkBMC3tQngTC2415y4huA/V9NB2JmzzD1msvjglSVpz8rRmumTlCkpjJhMFH2pwrS8K96byP47gAg1qSfZjlZFMDLE185g1oVnAgcQUBj8tnsfKFter/A/sb+VXswAywXmMcyqsHrhdcPvdFPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763569051; c=relaxed/simple;
	bh=/ZyPr0bolrQOFzFOw5n1ZDUctiYcQCYBM+n5jgHJUJ4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=XQcxsUhzGtiksx3uUFDWkh7E89NY1akNqGYuJ3xw/uUOtLzr/VTu/AhIkCP/N0BxsY5J3WNbQ8uDIuEG+kzqwZGOvA2bHDIwy9q0QcAgyt+4A4qzrP2ieC20LoKcNqiVK6TphWRAef93qOBfTYs1i0TJs4/BlVGvZubwuNtifKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s4tKULAC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s4tKULAC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03E42C4CEF5;
	Wed, 19 Nov 2025 16:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763569051;
	bh=/ZyPr0bolrQOFzFOw5n1ZDUctiYcQCYBM+n5jgHJUJ4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=s4tKULAC877T/tmiAxjgqBNoHJJLJDsHoqSCQeFN4wWFGrl71RTneGefYdprO+0iK
	 ErF9V21sCXOZnyDCCTWjEjQSrSXDuPTzr+k4qQBHTOCnzwo/rxowS+J9wCeYsKjb6M
	 3oxSO3yDZNwtW1swd9Ci8KwNbYN+9YGC3zWDAjdaqTlFoK6CXCXny0G57VbxDKgVHI
	 Sm5FwHl1dR10sTHalmlYdSCRqBXADSgHJK2OKDj0PipMUwz6MuoMGXg7tD+fXLKPcU
	 A+VY528QS5OhThav4h2zSdx2eVIkWJnBIFVdrQVWURKqY7DIthho+IfAsIhH+4txIo
	 1FLkCoHJJb5GQ==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Yixun Lan <dlan@gentoo.org>
In-Reply-To: <20251111111930.796837-1-andriy.shevchenko@linux.intel.com>
References: <20251111111930.796837-1-andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 0/2] mfd: simple-mfd-i2c: a couple of cleanups
Message-Id: <176356904975.268862.5196177981414997871.b4-ty@kernel.org>
Date: Wed, 19 Nov 2025 16:17:29 +0000
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-52d38

On Tue, 11 Nov 2025 12:18:34 +0100, Andy Shevchenko wrote:
> Here is just a couple of ad-hoc cleanups. No behaviour changes.
> 
> Andy Shevchenko (2):
>   mfd: simple-mfd-i2c: Make ID table style consistent
>   mfd: simple-mfd-i2c: don't use "proxy" headers
> 
> drivers/mfd/simple-mfd-i2c.c | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
> 
> [...]

Applied, thanks!

[1/2] mfd: simple-mfd-i2c: Make ID table style consistent
      commit: 81d2cc9272df8c01e36a963dd8b23ca585b68032
[2/2] mfd: simple-mfd-i2c: don't use "proxy" headers
      commit: 46bddb5fbe7e3cb73204a952dbd4687cf0974ef5

--
Lee Jones [李琼斯]

