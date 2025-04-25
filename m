Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E74A81E
	for <spacemit@lists.linux.dev>; Fri, 25 Apr 2025 00:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745540576; cv=none; b=qrqs/pQOJ47Ckictd0owyOsXk7netm5+Z7wu36+mVWyZEB0nXso39UGSorT0Sr00HA4OhVN0bYEMmXa4HypwcIsSpKqoR2a6slmDaaHLctGur7e4n5fsJL4QVb9VMUgkwxxx2X4IARdRRs32BnjdSm4FKsuXbcf7obt1r16WCzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745540576; c=relaxed/simple;
	bh=/dwvMdYVKjC9JaRSGxPVTV/CoSY3VmlHD55b3+V/7Es=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DdmAJl2wyGq5Tkaz++tpOC80E9E5e24q62Oak3MYzfQ6qUPo3QQAV/Ovyavcjt1hM3N1QD4fnxVCAsyrAHmgcc8q0cY+gXxpnt9atFfrU/G3HFx53m4nsQzVYyueODQ36ebryI6Fu0AOrI73rs02lFlyI1M1a8ldRi2TSBf7ObE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.18.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id CBB5A342FA4;
	Fri, 25 Apr 2025 00:22:53 +0000 (UTC)
Date: Fri, 25 Apr 2025 00:22:49 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Daniel Maslowski <cyrevolt@googlemail.com>
Cc: u-boot@lists.denx.de, xypron.glpk@gmx.de, spacemit@lists.linux.dev
Subject: Re: SpacemiT K1x / Ky X1 DRAM init
Message-ID: <20250425002249-GYA49938@gentoo>
References: <CAJCpOFyMyXZK7Hz7mTOwHRREQEWf-=ghgLXU5RgzTMxQj7MnZQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJCpOFyMyXZK7Hz7mTOwHRREQEWf-=ghgLXU5RgzTMxQj7MnZQ@mail.gmail.com>

Hi Daniel,

On 20:26 Thu 24 Apr     , Daniel Maslowski wrote:
> Hey everyone,
> 
> As discussed in the last community call, I have written a fully open source
Where did the discussion happen?

> implementation of the full DRAM init for the K1x/X1 in Rust, based on the
> vendor U-Boot code. This would be trivial to translate to C. I would be
> happy if someone could pick this up for upstream SPL. Feel free to poke me
> should you have any questions. Thanks! :)
> 
I won't start this if speak for myself, but would glad to see anyone
else push it forward

> https://github.com/orangecms/oreboot/blob/all-the-things-wip/src/mainboard/spacemit/k1x/bt0/src/dram.rs
> 
> I could not find a RISC-V specific mailing list. Please forgive me for
> being email illiterate.
It's more likely vendor (SpacemiT) specific rather than RISC-V generic,
so Ccing spacemit mailing list to see if people interested..

-- 
Yixun Lan (dlan)
