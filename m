Received: from mail6.out.titan.email (mail6.out.titan.email [3.226.109.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A12CC224D6
	for <spacemit@lists.linux.dev>; Tue, 30 Dec 2025 04:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=3.226.109.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767067250; cv=none; b=GbdDS4WS6T0RXuDt+AaRv2ZO4mmyfCRjWfZ7oQnxKc7B/UH7eOwfRytxCdHS41LERLWa3DYD1TRpVZ/74U++IqPA8r5dv+HdX2hKS/+OLZeO8fZeDUA6IfOsXAtHbMqyNJ42aI7PPF4uNl0Gb+RA8VInW3ygCn46ESt+lKqY9pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767067250; c=relaxed/simple;
	bh=1ONqKZx5PdEBhFKEt79JjEbzTIPZpjNM+AUA64VXfpw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CSLX/1euAS1c671NuDn3a/wb9tDNTNZ3S31awmth1Qi2DTl+iGNAgijaD0xhb0YCtTlHVHQvg2wpygfjK91cKu832oYxcZMekzIBQvLrHNcWSkZPLp8zPMH6jJTTTpbclvAb3ShtZv9utgAqQfesdrb2i/bLoOUTWeVUsQWfULU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ziyao.cc; spf=pass smtp.mailfrom=ziyao.cc; dkim=pass (1024-bit key) header.d=ziyao.cc header.i=@ziyao.cc header.b=NsV8C8cW; arc=none smtp.client-ip=3.226.109.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ziyao.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziyao.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ziyao.cc header.i=@ziyao.cc header.b="NsV8C8cW"
Received: from localhost (localhost [127.0.0.1])
	by smtp-out.flockmail.com (Postfix) with ESMTP id 4dgKBK1bPTz7t7k;
	Tue, 30 Dec 2025 04:00:41 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; bh=pgoi0kavrdiXHW8AgEZoYSacqFxVye/voJVKHdbpWi0=;
	c=relaxed/relaxed; d=ziyao.cc;
	h=subject:mime-version:to:date:from:cc:message-id:references:in-reply-to:from:to:cc:subject:date:message-id:in-reply-to:references:reply-to;
	q=dns/txt; s=titan1; t=1767067241; v=1;
	b=NsV8C8cWdw/MPZHR9ezKCn7T7LEkPtCv2LrM4rAaZmXAjFJU3bBnNhhqNAm0c67Lu2qavpO9
	+r6niwOo6bmH3k5sLceL5uRUy1lnoroK0W5FgFrvQ4Jx+I7aYLNIK604vpZ4r51rdAVktNfmM/P
	YtS6Q6B1ooSb47FI65xKJHec=
Received: from pie (unknown [117.171.66.56])
	by smtp-out.flockmail.com (Postfix) with ESMTPA id 4dgKBF3PBtz7t7g;
	Tue, 30 Dec 2025 04:00:37 +0000 (UTC)
Date: Tue, 30 Dec 2025 04:00:34 +0000
Feedback-ID: :me@ziyao.cc:ziyao.cc:flockmailId
From: Yao Zi <me@ziyao.cc>
To: Alex Elder <elder@riscstar.com>, Yixun Lan <dlan@gentoo.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Guodong Xu <guodong@riscstar.com>, Inochi Amaoto <inochiama@gmail.com>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v2 2/3] clk: spacemit: extract common ccu functions
Message-ID: <aVNOYuC0-lcymn-P@pie>
References: <20251226-06-k1-clk-common-v2-0-28b59418b4df@gentoo.org>
 <20251226-06-k1-clk-common-v2-2-28b59418b4df@gentoo.org>
 <3ea5b28b-a0ed-49fb-a8a8-6f575a24820d@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3ea5b28b-a0ed-49fb-a8a8-6f575a24820d@riscstar.com>
X-F-Verdict: SPFVALID
X-Titan-Src-Out: 1767067241070516921.30087.1589077241347436584@prod-use1-smtp-out1002.
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.4 cv=WtDRMcfv c=1 sm=1 tr=0 ts=69534e69
	a=ILiXPvH1yGBXwyP4YTaA5g==:117 a=ILiXPvH1yGBXwyP4YTaA5g==:17
	a=kj9zAlcOel0A:10 a=MKtGQD3n3ToA:10 a=CEWIc4RMnpUA:10 a=VwQbUJbxAAAA:8
	a=9WVa6OCtZuRSJDRKafAA:9 a=CjuIK1q_8ugA:10 a=3z85VNIBY5UIEeAh_hcH:22
	a=NWVoK91CQySWRX1oVYDe:22

On Mon, Dec 29, 2025 at 06:50:14PM -0600, Alex Elder wrote:
> On 12/26/25 12:55 AM, Yixun Lan wrote:
> > Refactor the probe function of SpacemiT's clock, and extract a common ccu
> > file, so new clock driver added in the future can share the same code,
> > which would lower the burden of maintenance. Since this commit changes the
> > module name where the auxiliary device registered, the auxiliary device id
> > need to be adjusted. Idea of the patch is come from review of K3 clock
> > driver, please refer this disucssion [1].
> 
> I understand the point here, and it's just like the first patch:
> you're extracting generic code out of the K1-specific file so a
> new K3-specific source file can use it too.  This is really good.
> 
> However the end result should incorporate *only* generic code
> in the generic file, and have the SoC-specific source files
> contain everything else.
> 
> But as you have it now, the (new) generic probe function
> contains special handling for "spacemit,k1-pll", and that's
> not generic.
> 
> So I suggest you still implement k1_ccu_probe() (and k3_ccu_probe())
> separately, allowing each of them to do platform-specific things
> before (and/or after) calling the generic probe function.

I've raised similar concerns in the series for K3 clock tree[1].

Regards,
Yao Zi

[1]: https://lore.kernel.org/all/aU50DIe9qMneb0GT@pie/
