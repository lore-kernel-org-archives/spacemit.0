Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7B8A2D0292
	for <spacemit@lists.linux.dev>; Tue, 11 Nov 2025 22:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762901702; cv=none; b=X+XNnVAcNJGXQJv8IQMQvT28J4KZZxIeMUXKFrsL/iKHLivr6QPMeV5XygbGu5pReIChcmipWotL+32z53l2y0XkkKZG7LCVsqxGtJhb42+NjssNWtR4Vf6my+IFl1G2F6xRvE2+E/out/veq2QFuvdR6BmT5ZKn54pF9rVIUwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762901702; c=relaxed/simple;
	bh=nOSBX6CgmSKAf5yW0oAcxHwAIFI5WNbj110HK9iguhI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NbBYZ8N93Le5Lq9+3+h4MfmQb/7ip7zTploB3edAuKvRVklCV3U6JHXkBFAgYO+9a0VJsuvUNp5GxDNA3VNWeO5qUHsjzcSCInkC1qiSjfbALu1IlLrI+OoIP4iR8s9Qblxv8FNzqNfapxHc7+nvkLOVmfqDrGOZa4khkqgCgJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.48.119])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id E79B6340E2A;
	Tue, 11 Nov 2025 22:54:58 +0000 (UTC)
Date: Wed, 12 Nov 2025 06:54:53 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Encrow Thorne <jyc0019@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: Re: [PATCH v2] clk: spacemit: fix comment typo
Message-ID: <20251111225453-GYA1677982@gentoo.org>
References: <20251111-b4-fix-ccu-mix-typo-v2-1-d64b97b48d1f@gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251111-b4-fix-ccu-mix-typo-v2-1-d64b97b48d1f@gmail.com>

Hi Stephen:

On 23:50 Tue 11 Nov     , Encrow Thorne wrote:
> Fix incorrect comment to match the filename.
> 
> Reviewd-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> Signed-off-by: Encrow Thorne <jyc0019@gmail.com>

Reviewed-by: Yixun Lan <dlan@gentoo.org>

> ---
> Hi Stephen,
> 
> Could you please take a look at this patch for inclusion?
> 
right, this is a trivial fix, and as there is no other clk patch
for SpacemiT this cycle, so can you simply take it via your tree?

thanks

-- 
Yixun Lan (dlan)
