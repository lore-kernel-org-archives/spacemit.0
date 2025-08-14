Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2663B21ABA3
	for <spacemit@lists.linux.dev>; Thu, 14 Aug 2025 22:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755211852; cv=none; b=QLpCizHXRE2mHIW/9P1UOtX7/XlcZu1OJrcmpQ5t3aAC6S3j9V7pvojRvsAg00ON4n7d3UwT3p0Mpuvgy3Gsrpmx7k/L/m34VEw/qfb7YhPFqMGpcZAXcXto7biuPdXxHmLI1V3AQCNdtsoRlml68X2Myp3tTz0yCBAZjlcQB/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755211852; c=relaxed/simple;
	bh=k3g3av1ExpxSpGPQvhDqy0PXWfc84KcrITee0dOTqgw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eAOISnJXHSK6O6fPQVhkH+YU23V0jWHvrWAmVfjg7mw/cJQCv8JF3vmYHib/53A8zTnQUzqWoFaplbAIT23vYys32s4uI4TtWlve9Whq/Z45jIm2Aq4sAX3Cj1wyMTgu3Mq1Q+A8tbfVhUnVZeLiuU4BBsiSktifvOBkLLoV/5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K9+FFUc2; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K9+FFUc2"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-32326e8005bso1609201a91.3
        for <spacemit@lists.linux.dev>; Thu, 14 Aug 2025 15:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755211850; x=1755816650; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WVawUElbuEdpT/L0IVDdSj9wdhwbVEtke7BFQtXU6aA=;
        b=K9+FFUc2WceRQ8d+B4mGJpChRSWQfW/0hq/EaK+4DiGXLDaCNIGg+HG1HWkfRrmJqB
         W/mWET/bnKScC6fcIHUuoMRMkHgoQAxMzn2fByrDGCChBeR+Ntp+LFGCfGuA2PcT41Uk
         zDBhmZ7ZvzaR7Qf+Wkm1vzdYkWtkok8aFqpExCJ2mucSozsbjYlGVGEner5+TA/CAggM
         wb95R9HSEHAYokgEtHhAEKiMuvWJf7h6DkYu0lmQjBDBmHPxzSbb4L3Zh5rU2rrUMHVQ
         15MZ8UGFCdvUrRpojf5pUqhw3tUwyjoLNUntVGyc8wZvrviXTmSJm6WtyxkdWfilIwMj
         nsYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755211850; x=1755816650;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WVawUElbuEdpT/L0IVDdSj9wdhwbVEtke7BFQtXU6aA=;
        b=vS5RIeKuxxh+wzbuuH1Nr/6Xe9c8wwvUKxmh1qgnV24BjhIgrorkdyYZARqvdFRPHO
         kkvT8CoCL56TxzVoBp6hg+0FSVpOGForoMRs1UAtw6OMTSipIAyDeCP7ltBaDDr8IP99
         QpQa8+C5sxQbOPEcKMRm8/4qK+BTjMe9Q59dv5rb41ieLl2WTzKY+9j1pvczkoKDMRol
         VnFwy9JbK7axdPfcEfrPsCN8UNKUxzVxOgefCU3azxl2mcrikQxI4NvPDXntYv9WA1jj
         z2DNFjY8RhO9C500G2GKufORk0I0dXv8ChED3CysgA3Jl1+koDcl3WkvRyr8AeK5QRou
         ZXwQ==
X-Forwarded-Encrypted: i=1; AJvYcCUcdj0GnJiwdvUzKYoekmW1SgXYXu5YYlFtqdAbvC9TRvgPFw6m8hbN/4eSjeLZkdfYTclaAVzKfA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwVt/08aG+1g2FfqwOBHNut2k+fqtrTOwzYqEPnm1I3Cp+Mtwsf
	n0A6ZLB9djxHXNLcS/WPLnpuxQaiDV+w+c1BQVeDMVbBoNvTlR6R/EfM
X-Gm-Gg: ASbGncsWfcEGKTY95dGOB7vES9k+w4O1j49qZtKVMh3OEIOYYs7Rp/tljQUW2Bxnkfi
	VT5jBsRFA3KQFaEr24k2ycPAYLPpbZWghkHRKYprPtIAtJT6PMTuKTFVrtjzKgbIBrdetK8jBhA
	NOAhkxgWYyUPuXJsYfm4xwhyaLgCfI/O6DGEDKwMif58qJMyuKcJnggjzMMt5lAw4R1vycyI0mb
	DYRBrwu9klblXYS8bBuOBu15qVpEvz3epg/iU3+KhmVVsqPVfKm6yxORM7JqrI683oaVj1nLfL1
	wVDSSReXOB+9gdNgh0CI4TsRTZ+NYlBa+Is1DwbJzFT0XE/jw2a9xWioFxAA+seiOxkLNaMstm+
	2w69XeZeFuZr5KR6cFaMjYD7aM11puup3
X-Google-Smtp-Source: AGHT+IEJqNeT1yM7BjiHaonVA76lx9wIv7oauipmGKTTR2d3Fa2Yg6FGWlZUCw2T0pv6BwK2DA17bw==
X-Received: by 2002:a17:90b:1810:b0:31a:9004:899d with SMTP id 98e67ed59e1d1-32327a4f242mr8445796a91.18.1755211850284;
        Thu, 14 Aug 2025 15:50:50 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-b471519d8bcsm2721398a12.61.2025.08.14.15.50.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 15:50:50 -0700 (PDT)
Date: Fri, 15 Aug 2025 06:49:58 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Alex Elder <elder@riscstar.com>, Inochi Amaoto <inochiama@gmail.com>, 
	lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org, 
	bhelgaas@google.com, krzk+dt@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, 
	kishon@kernel.org
Cc: dlan@gentoo.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, p.zabel@pengutronix.de, tglx@linutronix.de, 
	johan+linaro@kernel.org, thippeswamy.havalige@amd.com, namcao@linutronix.de, 
	mayank.rana@oss.qualcomm.com, shradha.t@samsung.com, quic_schintav@quicinc.com, 
	fan.ni@samsung.com, devicetree@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-pci@vger.kernel.org, spacemit@lists.linux.dev, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Junzhong Pan <panjunzhong@linux.spacemit.com>
Subject: Re: [PATCH 4/6] phy: spacemit: introduce PCIe/combo PHY
Message-ID: <mj5e6afmbqo2tpt3zjuebcfif3flvgqq663erv3xuvbg72nd6g@bapy44nobzyw>
References: <20250813184701.2444372-1-elder@riscstar.com>
 <20250813184701.2444372-5-elder@riscstar.com>
 <valmrbddij2dn4fjxefr46zud2u6eco2isyaa62sd66d27foyl@4hrhafqftgb5>
 <4eaa30bc-9a25-4fe0-b685-1d0d8fa503c2@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4eaa30bc-9a25-4fe0-b685-1d0d8fa503c2@riscstar.com>

On Thu, Aug 14, 2025 at 07:15:43AM -0500, Alex Elder wrote:
> On 8/13/25 6:42 PM, Inochi Amaoto wrote:
> > On Wed, Aug 13, 2025 at 01:46:58PM -0500, Alex Elder wrote:
> > > Introduce a driver that supports three PHYs found on the SpacemiT
> > > K1 SoC.  The first PHY is a combo PHY that can be configured for
> > > use for either USB 3 or PCIe.  The other two PHYs support PCIe
> > > only.
> > > 
> > > All three PHYs must be programmed with an 8 bit receiver termination
> > > value, which must be determined dynamically; only the combo PHY is
> > > able to determine this value.  The combo PHY performs a special
> > > calibration step at probe time to discover this, and that value is
> > > used to program each PHY that operates in PCIe mode.  The combo
> > > PHY must therefore be probed--first--if either of the PCIe-only
> > > PHYs will be used.
> > > 
> > > During normal operation, the USB or PCIe driver using the PHY must
> > > ensure clocks and resets are set up properly.  However clocks are
> > > enabled and resets are de-asserted temporarily by this driver to
> > > perform the calibration step on the combo PHY.
> > > 
> > > Tested-by: Junzhong Pan <panjunzhong@linux.spacemit.com>
> > > Signed-off-by: Alex Elder <elder@riscstar.com>
> > > ---
> > >   drivers/phy/Kconfig                |  11 +
> > >   drivers/phy/Makefile               |   1 +
> > >   drivers/phy/phy-spacemit-k1-pcie.c | 639 +++++++++++++++++++++++++++++
> > >   3 files changed, 651 insertions(+)
> > >   create mode 100644 drivers/phy/phy-spacemit-k1-pcie.c
> 
> . . .
> 
> > > diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
> > > index c670a8dac4680..20f0078e543c7 100644
> > > --- a/drivers/phy/Makefile
> > > +++ b/drivers/phy/Makefile
> 
> . . .
> 
> > > +static int k1_pcie_pll_lock(struct k1_pcie_phy *k1_phy, bool pcie)
> > > +{
> > > +	u32 val = pcie ? CFG_FORCE_RCV_RETRY : 0;
> > > +	void __iomem *virt;
> > > +
> > > +	writel(val, k1_phy->regs + PCIE_RC_DONE_STATUS);
> > > +
> > > +	/*
> > > +	 * Wait for indication the PHY PLL is locked.  Lanes for ports
> > > +	 * B and C share a PLL, so it's enough to sample just lane 0.
> > > +	 */
> > > +	virt = k1_phy->regs + PCIE_PU_ADDR_CLK_CFG;	/* Lane 0 */
> > > +
> > > +	return readl_poll_timeout(virt, val, val & PLL_READY,
> > > +				  POLL_DELAY, PLL_TIMEOUT);
> > > +}
> > > +
> > 
> > Can we use standard clk_ops and clk_mux to normalize this process?
> 
> I understand you're suggesting that we represent this as a clock.
> 
> Can you be more specific about how you suggest I do that?
> 
> For example, are you suggesting I create a separate clock driver
> for this one PLL (in each PCIe register space)?
> 
> Or do you mean use clock structures and callbacks within this
> driver to represent this?
> 

I think using clock structures and registering them is just fine, 
there are many phy drivers already do this.

> I'm just not sure what you have in mind, and the two options I
> mention seem a lot more complicated than this one function.
> 

Yes, it is more complex than just adding one function, but it 
make the code clean and easy to understand as the clock looks
complex. Also, register this clock allow us to know the state
of internal clock by looking clk_summary.

Regards,
Inochi
