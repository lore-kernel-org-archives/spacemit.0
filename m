Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.154.119.183
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794950602;
	b=YBm7Umsu6acwjcYhmFFGcfoJvfwwJILPS7WdElaOWyrmpI7UALtlUbsZbf4S0pU1umwl
	 afVFyV7J4JamskCUcIKSIwtGE/pWXNh/zOTdw2zeUYYm4KivgtEnQw9WgPhY8XCKgBqsO
	 fLBXEAUeBiW+yhHskR10cPdT0K2OnmwP1di2bHxJzUtQHif1raeJVWb8LZhY3GciXM+hR
	 qMEZo9Z1cGxT46E/qwDwTv6TVmx3wPa/mqcoGGU3dYdKzV2JRZGqx2yCvxYWgxv2Q/IjS
	 NuM0q016OLM4aYHQIwm5aMdHlT/Jv4tog5Et9Pfh01dqnqnLwirKb1h4jeI09jEhZug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794950602;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:Mail-Followup-To:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:User-Agent;
	bh=Przrgbdbv85cvbqLBXsL7DGaaikgzPBDFnvarr+iJb4=;
	b=w2v60qQJgIWrsM3fgABYz6OlzhT116XIWrdTJhZNSACpOT5skG09PDr7S0T2JRbC+lFS
	 Ryw4RQo54UnFdQ4PSiCp7jzON1hjapG+/FXX7nTw17oWG9ElcB5DMVKCUC3++UTv2cSY0
	 UwCfydAWgljzMAzQlxccp8uu/TxQEpqILv9u4qV+dhVSKrUkOlL6mh6uuDgOyPfj+a8o6
	 2r81CTKsIKD/xAXFsWpCASwAMscFk2HBe4ukmreGE90xUpmHWlRCBhqoElPv1WxMwdMuS
	 wyLKh7VrDEsoDYyhzuq0ps5hanRTtUzJzykFfeYdOe1MWODupFSg/24jPS342YLo5WQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=aurel32.net;
	spf=pass smtp.mailfrom=aurel32.net;
	dkim=pass header.d=aurel32.net header.i=@aurel32.net header.a=rsa-sha256 header.s=202004.hall header.b=T2hjufLh;
	arc=none smtp.remote-ip=195.154.119.183
Received: from hall.aurel32.net (hall.aurel32.net [195.154.119.183])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0F00606A330;
	Tue, 17 Nov 2026 21:23:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0F00606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.a=rsa-sha256 header.s=202004.hall header.b=T2hjufLh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=Przrgbdbv85cvbqLBXsL7DGaaikgzPBDFnvarr+iJb4=; b=T2hjufLh0q4o5/+0lDWEDnqhGD
	Ah0i8IUkddvpr5lELGxNvbUY4ubRasOnxz5fq9KUXQL//6N1b2FfoDk/Xr/QCTtc+s8VJ9rfP9TRQ
	bK710C4dGLCWVcCNhs1YG4pOF18tK0noHDDmbSP7FSk0FpF8mp4Sy5uKjTxbBaC60pRy0X5reKqEn
	P1luZPbnd5+QSUEBCW5kOZROOvSqx2U6k2ZJmDz4EPyRxuAUDxbnEypps5W6+TAr61Iq7E26FDW7w
	NFkrpgW6FBLEWyBDo8LZxycbEilw3sDg3Mrpclacrp2EK4+c7WZbcvTvn22fmFS621wf5jS+fj38/
	M/hzmeiw==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1xTQe4-0000000GZBY-0QzT;
	Tue, 17 Nov 2026 22:23:16 +0100
Date: Tue, 17 Nov 2026 22:23:15 +0100
From: Aurelien Jarno <aurelien@aurel32.net>
To: Jiayu Du <duge1256@gmail.com>
Cc: srini@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, dlan@kernel.org,
	troy.mitchell@linux.spacemit.com, pjw@kernel.org,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	p.zabel@pengutronix.de, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] riscv: dts: spacemit: Add K3 eFuse and temperature
 trim cells
Message-ID: <avzFw8hydMX-9G1_@aurel32.net>
Mail-Followup-To: Jiayu Du <duge1256@gmail.com>, srini@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	dlan@kernel.org, troy.mitchell@linux.spacemit.com, pjw@kernel.org,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	p.zabel@pengutronix.de, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
References: <20261106060525.346873-1-duge1256@gmail.com>
 <20261106060525.346873-4-duge1256@gmail.com>
 <au5Q9lYTUegeEglv@aurel32.net>
 <uot2mqhilzdfngqcwpipdo5xzncyvesmw2hw6rqk7mnveer57f@6m4cqzotx53k>
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <uot2mqhilzdfngqcwpipdo5xzncyvesmw2hw6rqk7mnveer57f@6m4cqzotx53k>
User-Agent: Mutt/2.4.1 (2026-07-04)

Hi,

On 2026-11-13 20:24, Jiayu Du wrote:
> On Fri, Nov 06, 2026 at 11:13:10PM +0100, Aurelien Jarno wrote:
> > Hi,
> > 
> > On 2026-11-06 14:05, Jiayu Du wrote:
> > > Add the K3 eFuse controller with its AES_WTM clock and reset. Describe
> > > fixed-layout cells for the temperature calibration parameters stored in
> > > bank 0 and bank 7, using controller-relative offsets.
> > > 
> > > Leave the controller disabled for board-level enablement.
> > 
> > What is the reason for enabling it at the board-level? AFAIU, this is 
> > part of the SoC and does not require any board level hardware. Therefore 
> > I believe it should just be enabled by default.
> 
> Agreed, there is no board-specific dependency. I'll fix it.
> 
> > 
> > > Signed-off-by: Jiayu Du <duge1256@gmail.com>
> > > ---
> > >  arch/riscv/boot/dts/spacemit/k3.dtsi | 25 +++++++++++++++++++++++++
> > >  1 file changed, 25 insertions(+)
> 
> ...
> 
> > > +				#size-cells = <1>;
> > > +
> > > +				soc_rtemp_trim1: temperature-trim@120 {
> > > +					reg = <0x120 0x1>;
> > > +					bits = <0 8>;
> > > +				};
> > > +
> > > +				soc_rtemp_trim: temperature-trim@19a {
> > > +					reg = <0x19a 0x2>;
> > > +					bits = <4 8>;
> > > +				};
> > 
> > I have tried this patchset, and while I can see non-zero data in the 
> > /sys/bus/nvmem/devices/f0702800.efuse, both temperature calibration data 
> > appear as 0. Is that expected?
> 
> I see the same on my COM260 Kit: both banks contain non-zero data, but
> the two trim fields are zero. The factory 6.18.3 kernel gives the same
> bank data and temperature calibration data. 
> 
> The thermal driver change in [1] reads the bank 7 trim first, tries bank
> 0 if it is below 8, and uses 0xd8 if both values are below 8. This handles
> the zero-value case. I don't have an explanation for the zero trim values
> themselves.

Thanks for the explanations, that make sense. I guess that first 
versions of the K3 were not temperature calibrated, so the value is 0.

Regards
Aurelien

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net
