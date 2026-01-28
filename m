Received: from smtp-usa2.onexmail.com (smtp-usa2.onexmail.com [35.173.142.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE6C13469FF
	for <spacemit@lists.linux.dev>; Wed, 28 Jan 2026 09:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.173.142.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769592853; cv=none; b=PS9/cEVl2ZSDpphJMMx3fWJcNEWmrCQjJY0elcwutEL9Ps/QAKILTHsBR3SKLVaVleZ7CxlaF395cETf8J4y0UPz9s/MmZjuMcBFTWvuno0gkEWpSDZ0W1AJ/RjtC1iAOZJfHZdJAETgQjG7n5AAgspXMYY14ymR+YEYsvnxXZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769592853; c=relaxed/simple;
	bh=sVnj1C4avZi5lob/WW/jEcsuTEgkILKAFZaa3udSirs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mKPfb0inb8AOswRqHcbhcHJaPICwHytPqC4cQnzRnCi+dAD92VIQk9uSa9hy4YOhgAd0PzOO2YOln6PddLlLj4QlgO73oE8QvZ60UBv01/M1l6PST1upJZWaglNbXluduw+Wonrf5lYkrcO2wDwcLhAWLkZYe1ZZRVGA216CWi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=ZUGWTyM8; arc=none smtp.client-ip=35.173.142.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="ZUGWTyM8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1769592767;
	bh=YqgQ7XTWnwiLqJRqmob5IA4FpJiapKMV3EHIEwmKLvk=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=ZUGWTyM8Me+1zINdg/FP/yCjoNE8+anpE72BrxAcA8kyh9YZh75xWRTWmrXGHfDDi
	 hVJiGgtySfMegzlGyVabx4Re67DuHIDMvmwepRsbBG7y9UfdfNWLkCqRF+oD4AoQzy
	 mL6YDYSv75/9Rsx+wQD1C3KoEd8TP5kPkg9a8Gd8=
X-QQ-mid: zesmtpgz6t1769592759t9b968819
X-QQ-Originating-IP: wSV2IFKiia32OYtniGlD6DAAqZvlSdHLzBCZK1/Wp0o=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 28 Jan 2026 17:32:37 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 319744168602380696
EX-QQ-RecipientCnt: 11
Date: Wed, 28 Jan 2026 17:32:37 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Vivian Wang <wangruikang@iscas.ac.cn>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: Re: [PATCH] gpio: spacemit-k1: Use PDR for pin direction, not SDR/CDR
Message-ID: <85EFBB88D70FB64F+aXnXtS35RG_U6MeC@kernel.org>
References: <20260127-gpio-spacemit-k1-pdr-v1-1-bb868a517dbc@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260127-gpio-spacemit-k1-pdr-v1-1-bb868a517dbc@iscas.ac.cn>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MKzYG8XJzx27luHda+8viI9Zbcs2SNIwmBWR31bLVy7d4Whz+EeimKQt
	21JWgfTV5aWJfNYrs5hIzjlbfdFAJNmO+kKSWq3c60VgLJHpKNvj/jFVe6kftITNL9bkrAh
	031kqQQnf5Vhxi3kBExh4upNU2DFx1WIeRKDwlrqEIz8QlygV68APMK8C2OC0UAfgxNWwbO
	sPp6MqDF/InNLzc++z/7gNJV/aeqij3+f7Y0rDCiahKEr8im+QQRY0tO5VUt6dVwl0ecErR
	KWHwpQ5W/StWgR9OycHFys4kgXX334Rmwl/iBzRkwcLCUbC62DchViSXVJMRFe8x3nRxgbW
	DyQAe2Us1zdyIAiLRDwvR7C7yn+i/xqXVjsSLkf1oMuJixziWdq2WxDQ9ZfK29DVVEvtswP
	/jxjeXwtGtSO3yk3rnPA/MXjPm5CtRz8PAHpLm5xU9qyj4NG/gzQVV0JT7Aa2AEJPdely5q
	L1HcvJjxfT05s7vTJVC+uQwG/tXx1SGd1K87xneFERYV1C0xHcnCcmphRRas8DZ881gQ7WP
	5YqU8bWc1CNJwdHlFDqmLwwTnNIKiVyHhOJ+jq8jWYJqPogcdGQU54tl0A+mYt+APwZrgfp
	zgLRjS5wug7HeWw3DIFf5EVgWECmQ4LVLqSK5X7+dwGlHMLu7FYFz+KVNyfIHGR+CzzhuFs
	nH/8GrZ+hPgKqUe/n5VyVWzbyaYYGc486b+YpcopQYW6wlBDHVz0wl2oFSjQZcgdcYWd5rj
	lxW3ze0k+PCUwGoMw1Rs9uzEYEKqmTj7j4HiSI3SOBLKqROidZRfe81zMtFOBBDouxSfgfv
	LcdZFmGEEr6p8fAZKOJyGuofmTwVlvsVp8yhGJoaZMATVAwWbHdNrNpaywjAlUbN1szajyq
	jcHthvKySi5BJnEHuqBvAYTYYBYTzq4WQlHasIQBZ10SX0BDH/91Qd7Tu1gw8NuiTKMCkJ+
	km3W2kirXQ4MM+htGZRNlYwQya+JooAGecFIQYluhTuImB988QCv65howFD81CQwOKlJsda
	YX7Tzhf2G9oUIV5+/UX8Hwt8RKUuSQXLQkAKl7Zenog5UTi3vdWYnzwEvX1JNbE3owAbzLj
	3n/Bb4AsiRB
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0

On Tue, Jan 27, 2026 at 10:58:49AM +0800, Vivian Wang wrote:
> On the SpacemiT GPIO controller, the direction control register PDR is
> readable and writable [1]. Therefore, implement direction control by
> using PDR as dirout, and don't mark it as unreadable.
> 
> The original implementation, using SDR as dirout and CDR as dirin, is
> not actually a supported configuration by gpio-mmio. The hardware
> supports changing the direction of some pins atomically by writing a
> value with the corresponding bits set to SDR (set as output) or to CDR
> (set as input). However, gpio-mmio does not actually handle this.
> 
> Using only PDR as dirout to match the expectations of gpio-mmio. This
> also allows us to avoid clobbering potentially important GPIO direction
> configurations set by pre-Linux boot stages.
> 
> Found while trying to add PCIe support to OrangePi RV2, where the
> regulator (controlled by GPIO 116) turns off on boot while some other
> GPIO pin in the same bank is touched, which is not desirable.
> 
> Link: https://developer.spacemit.com/documentation?token=Rn9Kw3iFHirAMgkIpTAcV2Arnkf#18.4-gpio # [1]
> Fixes: d00553240ef8 ("gpio: spacemit: add support for K1 SoC")
> Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
> ---
> Tested on K1 only - help with K3 testing would be appreciated.
Confirmed that PDR is also R/W on K3. Thanks!

Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
