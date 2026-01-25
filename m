Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 785BC17DFE7
	for <spacemit@lists.linux.dev>; Sun, 25 Jan 2026 11:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769339027; cv=none; b=UatAMU1iJEUweoAgG5fPe+QDv3zJOfuje6p3A379TjO5mBZ+gab3Nq+lwiMZ+SJHngg3m+34XAXDioPS65R1uwbCZCQwkz9Gn5Z981ubWy+ohsySn4xKqCdXFHwyvI/bjgO3094WyV2oLOv1Ac3KyI6PkaXkYKEpdVhmooPNgV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769339027; c=relaxed/simple;
	bh=oguidiIP4bpXhK6dJifeJicvaPonb1HrsjAzpgRDyqY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uBYLenIvRf3iba2VlGE5hIbkIyK+pblX2OsYcdYaqeiDzYLq7LTyb6yMh3uKDDYeIn6qnXe1megqcP/EkaGTypgo8oS4rB7qWT5/uvxB53nuo6m46+wJFO+diUKcgVmPwVwXRgcE8s6spPmzUSr+npkiS+3vDVX2DL0bjFYgv0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.27.242])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id A7618340F77;
	Sun, 25 Jan 2026 11:03:43 +0000 (UTC)
Date: Sun, 25 Jan 2026 19:03:33 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Guodong Xu <guodong@riscstar.com>
Cc: Vivian Wang <wangruikang@iscas.ac.cn>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Alex Elder <elder@riscstar.com>,
	Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 0/4] regulator: spacemit-p1: Fix voltage ranges and
 support board power tree
Message-ID: <20260125110333-GYD71302@gentoo.org>
References: <20260124-spacemit-p1-v2-0-2c86b06694ba@riscstar.com>
 <76bd53dd-0ca9-4358-a0b6-a49283e43c5f@iscas.ac.cn>
 <CAH1PCMZq++FYr_2WB=HvouXvnxcYGFk6tngqNUk3zTOM6xXLZQ@mail.gmail.com>
 <CAH1PCMbEcVa6mAvw9UAG2T2Jy0W-+nEcw79nTHDJr9xgEdm0VA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAH1PCMbEcVa6mAvw9UAG2T2Jy0W-+nEcw79nTHDJr9xgEdm0VA@mail.gmail.com>

Hi Guodong,

On 12:27 Sun 25 Jan     , Guodong Xu wrote:
> On Sun, Jan 25, 2026 at 12:18 PM Guodong Xu <guodong@riscstar.com> wrote:
> >
> > On Sat, Jan 24, 2026 at 2:25 PM Vivian Wang <wangruikang@iscas.ac.cn> wrote:
> > >
> > >
> > > On 1/24/26 08:20, Guodong Xu wrote:
> > > > [...]
> > > >
> > > > Note: Patch 3 introduces a bisect breakage by transitioning to
> > > > pin-specific supply names. Probe failures will occur on existing boards
> > > > until Patch 4 updates the corresponding DTS file.
> > >
> > > Ouch, that's not a bisect breakage, that's an *ABI breakage*. And AFAICT
> > > this is still not okay in 2026,
> > > see Documentation/devicetree/bindings/ABI.rst
> > >
> > > So the bindings would need to be changed to accept both the new and old way.
> >
> > Ideally yes. However, considering this ABI change's actual effect, the two
> > K1 boards (BPI-F3 and Jupiter) in the kernel get their power settings
> > from boot firmware as well, and the types of peripherals enabled in the .dts
> > files are very limited, the probe failure of the pmic regulator doesn't
> > affect much. So, I think this breakage is acceptable.
> >
> > >
> > > Driver-wise, at a cursory look from someone not familiar with the
> > > regulator stuff, maybe we can make it compatible with old DTS by adding
> > > the new names as aliases ({devm_,}regulator_register_supply_alias?) as
> > > "vin" or "buck5", if we see the old vin-supply definitions?
> > >
> >
> > We can do that of course. My hesitation is, however, it makes the driver take
> > extra code which may not be needed once all .dts files have been updated. The
> > driver code will be left there forever.
> >
> 
> Mark gave his opinion in v1 review [1], please allow me to partially quote
> here: "(it's an ABI change so shouldn't really happen, but perhaps there are
> few enough users for everyone to coordinate and it's what you all prefer)."
> 
> I do expect to collect more ideas before I decide whether and what to do in
> v3, or maybe v3 is not required.
> 
As I checked the dts tree (DT queued for v6.20), although we introduced the
regulator of P1/PMIC, but there is no consumers so far, so in real life, we
shouldn't break anything. In this case, I'd suggest we just give up for doing
the ABI backward compatible work which should simplify our life..

> Link: https://lore.kernel.org/all/2e2c2754-fd3e-4fd3-aae4-d7af63e3b528@sirena.org.uk/
> [1]
> 
> > BR,
> > Guodong Xu
> 

-- 
Yixun Lan (dlan)
