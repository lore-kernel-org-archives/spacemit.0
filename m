Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19474383C95
	for <spacemit@lists.linux.dev>; Sat, 18 Jul 2026 09:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784365703; cv=none; b=LvtL3d5lD7v19Qtqec3I8TjDF7+6lrfPfKadULinjczSavCWXHbYZRJWwkq2OK0RVKicBk1S2B5Zv+E9FedES1gyhi1E9RSWnQ4CX522XUojD95HD8PKYav1Qej4GGpj7DOrhonlOjPF57+a5EMauoPa6sR4Dwj5kVHcOVZ55lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784365703; c=relaxed/simple;
	bh=P940IKil3KNOg79W+B7JzGaqUQgGye5SZmAiJUN64ok=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W6JKPrdTdFlSs4+LkwBXPTlWHPubOHye8JPbkGyP3ncS6NL7CySIGIWEUgMAnMexv6bD+mEplKMsG1dwITOzHW1G0lwuLYl2X6n3cRSQ6UVE8BimTjZLwhDqx5W6r4A5U3n4b4UsSxc/9ql907Xd69W1Oay83xHtRUSSeQLwXto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rembrandt.dev; spf=pass smtp.mailfrom=rembrandt.dev; dkim=pass (2048-bit key) header.d=rembrandt.dev header.i=@rembrandt.dev header.b=WQ1f7ceT; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=azBElWfG; arc=none smtp.client-ip=103.168.172.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rembrandt.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rembrandt.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rembrandt.dev header.i=@rembrandt.dev header.b="WQ1f7ceT";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="azBElWfG"
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 1FB9814000DD;
	Sat, 18 Jul 2026 05:08:20 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-09.internal (MEProxy); Sat, 18 Jul 2026 05:08:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rembrandt.dev;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1784365700; x=
	1784452100; bh=P940IKil3KNOg79W+B7JzGaqUQgGye5SZmAiJUN64ok=; b=W
	Q1f7ceT6jaXflfHiJXwp45MXVXt3Iaj/TKOHZApzKKKMz7rh9feWEssWdB6keQRc
	nYA5wpGbsGWgZB5clGG612mfZVPASFVVPIdCafYfFtI91rzp64MZrX6fCrhJn1XZ
	xIogyW/ieUzpiE3NayLOozub9jemWiBxwXF1yWBRFKKJja0R8SpQc2Lkmpayj/4l
	85u/xnkaJ8O3id6hwsXaUFE6kCFP0Cay4+i8Ls7HQLhLxzpXwS8ZpenBCP/paVfZ
	ZrBV6xVgUxvzOVEw2jjZa9qNIxciY4EHPzlB9zDx2H9pXl4Qq44YgDDiaLzdn+1F
	+cUmVG4Ql0Eb4yhRvXVcQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1784365700; x=1784452100; bh=P940IKil3KNOg79W+B7JzGaqUQgGye5SZmA
	iJUN64ok=; b=azBElWfG5/Hjbs06IY8t+VEmGwr+DfvnIt5r2+LsNrwLjRZ+GCH
	DPQWvzz2oI/4QlqYdxFLdnjp3ZnJa7Ei/kMq2b+I/ne3tJ3OQ/Dgo04bJjdy2JtX
	RiG7PaIi4yJK8NkBMZtxUrRTMKHlGCMNJANc8Oe2Abm7ndaeQsqh9sBuaMOJWed3
	Noq4B2exiXB8fvxaXKAJ0BNBuZkxOJivkGefIaOkrm4zNfUq/6cfSzqMuxlnitaf
	2IpeODcDjomVHaBsAQS+KWXtlryBJcqe6QrIJFFwNlwW1GTbjKAmHSYRKnRmCWu6
	4vg6iPqM6Hdo+zIaKYI4hyVAhJ2Ar5N3AVQ==
X-ME-Sender: <xms:gkJbajG7Nxo4tz_YW4sdVxkoB9zB7YeFiRrqpQfQWuC3XGQ5gSCEYg>
    <xme:gkJbarTYRNpwAtdBgfGKBSGnVv5CR0KPa8saTWzoLFt_C1ionEZp35PUu9pLw4-CL
    vz1h3mYcZ7rxzvIvxFo-YEs71hXvfNdVTELGiBO0-IOV_nNf4r8>
X-ME-Received: <xmr:gkJbakJz-rUnpMEv5-8nns1JIowpAb2soCvUqa57S_2laa04_4EgTwNtM0M>
X-ME-Proxy-Cause: dmFkZTGvs6vg5bE9KEwkUoXOCAsx94wlDVx5fS+eeKRsAnDA3OiT9zI4z7yuoEIULyFdG+
    zZ5fAbRrnMzL/9vbBZUilAyxABUVj+ar0DtN6R0fJ1Jx6i8162iqn3X7KE/92uaZr0/WwI
    7muFHLBWdKvHJ9gStLs8xxDUqJ5KzYgsoagQ5SmRXm2KG2KhhNBuQ3P9gK7cAGms1jIqKj
    Xv7uvJrjn/PvtTgQ1lbAVkHyH48i6itw9fmI+wGgCfNn52crlPsfEbdsNA/em0OlqBzxJR
    szTlg2Bhq+R1Id3kWBukBUyPlIym1Usty297/fUeynfSgBftMO4gZa3Y1YBSQcq5u/EZOf
    erC+91nY9ktXN1UYYRKZATTbgEoTumaoYc2ScJLWbGgJQmaAub8ha3V9TtsOexPJACFx1Z
    UPZ3kjuKtSaRkA+Ao71kMMebBqFkZe/GnwWzcKCI+ftieDB7SBMKOuBkCmOuMz38w5FAXy
    uWa8BNtuBrzvPUHecne9JEnlXW1HqPb/uyhYS/G0oKYzN3DxmCpNhmVKtCCod1jnAs0KNW
    BeBvQnfvFkBlpX6Ry84GbSCX0UAqbS+oQML60SBGomJZuHP9iZvfK2XQOygGDWE8MuopTO
    wyjAXYdLo8S+TOLQbxnnS8jPqaOylnCO4Nlp3oed0pGF3Ibq0nK/clwqbfQA
X-ME-Proxy: <xmx:gkJbamZj1vqALVMLTvWq58q8ywlgKrufGrkXCK66L5AlYxqVB-bxgw>
    <xmx:gkJbam_S4Wv-5Thhv4XkRLVG-mOoRRh1ZDpRxkRp-B0nmeG1P_u28Q>
    <xmx:gkJbanbBOaHxNhVu0idz6WXNtCCZPUFT5hd-YTYupTvKjV-Lx2QJ_g>
    <xmx:gkJbaqM35H2nm7PwJnquFyGYxi5QN5lEnpUNYHNmJrzipv4Sk_HEhA>
    <xmx:hEJbaugrPcswBVLWMMhY7n28JEERoZGpHK4_sz7Q7BglFJgBIIJU52F8>
Feedback-ID: iec564b6b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 18 Jul 2026 05:08:17 -0400 (EDT)
Date: Sat, 18 Jul 2026 11:07:16 +0200
From: Andrew Rembrandt <kernel@rembrandt.dev>
To: E Shattow <e@freeshell.de>
Cc: Yixun Lan <dlan@kernel.org>, Inochi Amaoto <inochiama@gmail.com>, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: spacemit: k3-pico-itx: Fix non-functional
 ethernet TX timing
Message-ID: <als2a8ra4PB6Y1t5@mcmanus>
References: <20260608182358.170489-1-kernel@rembrandt.dev>
 <aiemGajqcQeY9avz@inochi.infowork>
 <aihYftGNcpUd4UUR@mcmanus>
 <aiid4Y6x6Dbbwszf@inochi.infowork>
 <aikmOfazxdrhpty7@mcmanus>
 <77a48b81-7906-4e18-9229-48643a67f402@freeshell.de>
 <20260710022551-GKA106000@kernel.org>
 <738ce6b8-798b-4689-a0f5-791fe85addbc@freeshell.de>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <738ce6b8-798b-4689-a0f5-791fe85addbc@freeshell.de>

Hi E, Yixun,

On Fri, Jul 10, 2026 at 07:34:34 am E Shattow wrote:
> On the topic of this ethernet TX timing thread I don't know what
> this does? Is there a test situation I may try to know if it is doing
> anything? Thanks very much, -E
Apologies for the slow reply -- I've been swamped the past month.

Thank you for taking the time to test this; your results are what
prompted me to go back and re-test properly, and it turns out my
original premise was wrong.

The non-functional TX I originally saw was not fixed by this delay
property at all. An unrelated commit that landed between v7.1-rc1 and
v7.1-rc7 is what actually fixed the dead TX on my board. While
developing this patch I'd inadvertently picked up that change, and I
wrongly concluded the tx-internal-delay-ps addition was what got traffic
flowing.

To confirm, I re-ran a series of iperf3 tests without the delay patch
and saw no transmission problem whatsoever -- a full 1Gb/s in both
directions with no errors. So this matches exactly what you and perhaps
Yixun also observed: on a current base the property makes no measurable
difference, because the TX path already works without it.

Given that, the patch isn't the fix as described in the changelog, and
the property has no functional effect on this board.

Yixun -- since you've already applied it, could you drop it from your
tree? A revert is fine too if it's landed somewhere non-rewindable, but
I don't think it should go upstream as-is: the "Fixes:" tag and the "no
ethernet traffic passes" rationale are both wrong. Sorry for the hassle,
and thanks for queuing it in good faith.


Sorry again for the noise, and thanks E for the careful testing that
caught this.
