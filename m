Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD6F71A683F;
	Sat, 16 May 2026 05:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778909854; cv=none; b=THI3M8sdKMbFuodo5i6QjUPtI003KXFkrvK8xjjL88K7Yt40u4KFDuFnFMinD4yi5ury/lEcShNcwzKfYLcdk+Z7M6LaA46Sa3f69875n3OxqcG+iva73bfhQxyIi3p5VoEkpALMqZdVtN8IJVzqeRn4yIWaAGg5T2yG6lGPk94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778909854; c=relaxed/simple;
	bh=8yBvfhLzYDJAvKIHnzpbKWBDmTKaskcNlT36hAQ0Img=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j49GsB6d5jG19q4MnI2AIow4reih3C48mYn6un9S04oIcE8KwnKC3ufwq9J3g6PM+0ad8gNTvnlUTnT61WB93MZNxjqm+etx6fQeQ3dFXbMC+eealaMlKKY9UBbBqQ6QCNjNlPlMHwWlB5+3sb9lX/drRcQ3/49cOaQMvI/z/u4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fK1aSbm8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fK1aSbm8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64DF4C19425;
	Sat, 16 May 2026 05:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778909854;
	bh=8yBvfhLzYDJAvKIHnzpbKWBDmTKaskcNlT36hAQ0Img=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=fK1aSbm8mudfk4ee6EzKpdHjeIFsFfF7nm+GOPlpahSUotCWY0ksHkUGF0m19EPrY
	 g7GKFh7EWTb+zSaVr5DrMQOy8/YmU9Euao08L9AS3Ba4d3BU0ce17We++sgwaXZb3k
	 DOpv0NSN11xQ9ubjC1lofG9vE+ItMhTPE/gwz5/JPDrGvwxuDNmJgF7SHeIxz+oLay
	 0A2DxcvfWSluN1ERcvKOpZE4ITsDfuM85GDxsK3YAR/Z1/cfpszJTjxW7bj2JHODv+
	 DpKSTCb+zmpj+AO9EyQbRjTYA/dfhXJ9v6RdZLSIX2HUUGLnzXlhft9Ym9XMKMnekg
	 C149fh8jHax6Q==
Date: Sat, 16 May 2026 05:37:30 +0000
From: Yixun Lan <dlan@kernel.org>
To: E Shattow <e@freeshell.de>, linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
Subject: Re: [PATCH 3/4] riscv: dts: spacemit: enable eMMC on Milk-V Jupiter
Message-ID: <20260516053730-GKA3675990@kernel.org>
References: <20260514160356.1642075-1-aurelien@aurel32.net>
 <20260514160356.1642075-4-aurelien@aurel32.net>
 <f52a821b-157a-467d-84ee-4d1d4a96f673@freeshell.de>
 <agbP0-OsfQRFJcr0@aurel32.net>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <agbP0-OsfQRFJcr0@aurel32.net>

Hi Aurelien,

On 09:48 Fri 15 May     , Aurelien Jarno wrote:
> On 2026-05-14 23:49, E Shattow wrote:
> > On 5/14/26 08:56, Aurelien Jarno wrote:
> > > The Milk-V Jupiter board has a connector for an eMMC module. Add an
> > > entry for it in the device tree and alias it mmc0. As it is not
> > > populated by default, do no mark it as non-removable.
> > > 
> > 
> > The meaning of "non-removable" here is whether it is expected to be
> > added and removed during use, requiring to be probed again; not whether
> > it is a user configurable module or soldered down part.
> 
> Not connecting the eMMC module and larking it as non-removable causes this info
> message to appears in the logs:
> 
> mmc0: SDHCI controller on d4281000.mmc [d4281000.mmc] using ADMA
> mmc0: Failed to initialize a non-removable card
> 

I'm with E Shattow here, and would prefer to add "non-removable" property,
Unlike SD card, the eMMC has no CD pin, some logic may be handled slightly
differently.

For that failure message, I have no idea how to deal with it but might
just ignore it.. Guess it's the price that have to pay if enabling the
eMMC in DT but has no module soldered or plugged in?

-- 
Yixun Lan (dlan)
