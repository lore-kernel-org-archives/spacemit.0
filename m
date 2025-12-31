Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F2431DE3B7
	for <spacemit@lists.linux.dev>; Wed, 31 Dec 2025 02:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767147131; cv=none; b=G6o+Bjm0pUSxcpjRXrFJ8X4y8einpLAtPtlHjISQFUAVSkk+GwPl9pN1mR1yfcX89SP/uoRax7jn/nt6qYfkE7EIYCPbLlfehwKagVR3Lxm7a0WPnx6J7hTENb3TfTxMelFsBr3Jl2ISuDdnujfMHoxwtKBClXI06P5bfPKBCVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767147131; c=relaxed/simple;
	bh=QvmG+eFKv1JWtWQnjs/o6EkdNYKRf7Abk90+EMzqHUk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eVR7eYN/z44RLLHjDsye7O9p86TSNq1JI5G+l10+qsALp/6YzUk/JBtaylJZD2YPTOIX6S/uDR8yrkfBGOrqj9ElXcGvOY6gtxwCsWAqebzirKgCarY+js/UKprqbCNALRyV4bAz2PFBpu+4kdYRAQSePds/jkhh01tJAfWYcSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 94570340D40;
	Wed, 31 Dec 2025 02:12:09 +0000 (UTC)
Date: Wed, 31 Dec 2025 10:12:05 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Yao Zi <me@ziyao.cc>
Cc: Alex Elder <elder@riscstar.com>, Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Guodong Xu <guodong@riscstar.com>,
	Inochi Amaoto <inochiama@gmail.com>, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH v2 2/3] clk: spacemit: extract common ccu functions
Message-ID: <20251231021205-GYB2019108@gentoo.org>
References: <20251226-06-k1-clk-common-v2-0-28b59418b4df@gentoo.org>
 <20251226-06-k1-clk-common-v2-2-28b59418b4df@gentoo.org>
 <3ea5b28b-a0ed-49fb-a8a8-6f575a24820d@riscstar.com>
 <aVNOYuC0-lcymn-P@pie>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aVNOYuC0-lcymn-P@pie>

Hi Alex, Yao,

On 04:00 Tue 30 Dec     , Yao Zi wrote:
> On Mon, Dec 29, 2025 at 06:50:14PM -0600, Alex Elder wrote:
> > On 12/26/25 12:55 AM, Yixun Lan wrote:
> > > Refactor the probe function of SpacemiT's clock, and extract a common ccu
> > > file, so new clock driver added in the future can share the same code,
> > > which would lower the burden of maintenance. Since this commit changes the
> > > module name where the auxiliary device registered, the auxiliary device id
> > > need to be adjusted. Idea of the patch is come from review of K3 clock
> > > driver, please refer this disucssion [1].
> > 
> > I understand the point here, and it's just like the first patch:
> > you're extracting generic code out of the K1-specific file so a
> > new K3-specific source file can use it too.  This is really good.
> > 
> > However the end result should incorporate *only* generic code
> > in the generic file, and have the SoC-specific source files
> > contain everything else.
> > 
> > But as you have it now, the (new) generic probe function
> > contains special handling for "spacemit,k1-pll", and that's
> > not generic.
> > 
> > So I suggest you still implement k1_ccu_probe() (and k3_ccu_probe())
> > separately, allowing each of them to do platform-specific things
> > before (and/or after) calling the generic probe function.
> 
> I've raised similar concerns in the series for K3 clock tree[1].
> 
> Regards,
> Yao Zi
> 
> [1]: https://lore.kernel.org/all/aU50DIe9qMneb0GT@pie/
> 

Ok, since both of you raise this, I will do it in next version
thanks

-- 
Yixun Lan (dlan)
