Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FA553A783B;
	Mon, 30 Mar 2026 09:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774864591; cv=none; b=fg3eme15IihxqavUR1bAS0OuZ6x2z4XwFpwG6Z/HnqGtQcpGynAsGspd2ddVjccf1a4RW1o61RmphXS+r77BVEWG8nzAgy/JhdqqLcy7SQnWFhWConBmpyyzpmN8a+Zo3uiOnR1Rr5J44SMnfZZ/qAgoOa5/sWf7s/FlcaIB9ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774864591; c=relaxed/simple;
	bh=JX+UmNr816pa1/GsAxK5jtXhX3XeILF2RnY6t4IhSpQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gbG5qft3YXOT97GiEY9Uhq0/LrJWvNPlVwvz8tVTyRiranLxk0/S4hKuusA6ckw+WplAGe6peg+GmAJaQ28EUlgVdNqAcH2JAoHKIq2jHAmmUJVZLndGFgYRZYpaznOXEeiCy777Ix1COop4lwMAZ8/jPMI+VAZz1+9unqBtDWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cySsVGnq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cySsVGnq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F4A8C4CEF7;
	Mon, 30 Mar 2026 09:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774864590;
	bh=JX+UmNr816pa1/GsAxK5jtXhX3XeILF2RnY6t4IhSpQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cySsVGnqgv1/05h0ZoMHNOCipkt80NYd5xFMNuVTYx+WhLovD5ruvXZe2bHHwqgOH
	 lRoEiyb9tWbdLM+26qfy++NPVbPyTZmWMVBLjqFqt5jk9nns+GjHNZKJhVJ+HSUIB/
	 LTf0fIlEcKZh+YrA1sElteqH5UzOcSA1FGwywHNtNdLBQFDVinSMeLv/rLl8X1obxf
	 dMQY9scSij+mM/u+Ws8z7EPIFCIjujwWLamE4IQkyai1bhSqif7d2yypyh6IR6jjNB
	 Mp9kslwlmVJim4Cba7V/invEuheElMC+Qfw+r0Kml8qLogbHsIQEgtQ7UDLk28Sf2/
	 r5p0MRVEnEg4Q==
Date: Mon, 30 Mar 2026 17:56:28 +0800
From: Yixun Lan <dlan@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	spacemit@lists.linux.dev, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dts: riscv: spacemit: k3: Add i2c nodes
Message-ID: <20260330095628-GKA960369@kernel.org>
References: <20260327-02-k3-i2c-v2-1-2119c0918868@kernel.org>
 <C57B2D153CF2A3F8+acpHUeQY8TSISRTR@kernel.org>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <C57B2D153CF2A3F8+acpHUeQY8TSISRTR@kernel.org>

Hi Troy,

On 17:50 Mon 30 Mar     , Troy Mitchell wrote:
> Hi Yixun,
> 
> On Fri, Mar 27, 2026 at 19:40:40 CST, Yixun Lan wrote:
> > Populate all I2C devicetree nodes for SpacemiT K3 SoC. The controller of
> > i2c3 is reserved for secure domain, and not available from Linux. The
> > controller of i2c7 simply doesn't exist from hardware perspective, as
> > vendor directly name the i2c controller used for PMIC as i2c8.
> > 
> > Signed-off-by: Yixun Lan <dlan@kernel.org>
> It looks like my Reviewed-by tag got dropped.
> The changes look good to me anyway.
> 
> Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
I realized this afer sending this out..

-- 
Yixun Lan (dlan)
