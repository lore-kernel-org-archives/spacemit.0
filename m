Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4173639FCE
	for <spacemit@lists.linux.dev>; Fri,  8 Aug 2025 01:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754616143; cv=none; b=V/kHVqqTyNF/imCX+3hu2JvxCfn0KumH0WMu/SBFTYpDKAEbbHGglF6lZfHT8n5VJE34kckJPm7odo+y7XcVWplAVTjcxHqtwm46jpcPYyzdJqp/iX+fJWt1/2dGXZA9hwIHNMqYxf8z51fcZV86Kjqb5BjEhz0462W3g38TtrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754616143; c=relaxed/simple;
	bh=+DX8W+FwNNw/MDG6n2LqOQwHvg6cOglOY7bkGn1f49I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fi6V/rPhmhGRXhAWBNa9qYw+Kuwu4zW+WGvTSVZETBYlGn8F5Dtfu54RuF5UDFFDWYa587LfW1bHKfa1HwAhpAOX9HtBNAgbsLj6FLS1M2Cmk56USBknqiDnDmHlIRK9tkr4JTdloV++9HEAEA8G8BbAHBbtP4l30af+IddtC9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=lsDK6tj0; arc=none smtp.client-ip=54.254.200.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="lsDK6tj0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1754616070;
	bh=YONhLCtVxAOKYtMTLs/xNzYwEhqj7k/VVs38rD2tJdw=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=lsDK6tj0XcLj81IS8zesmH8q0f7Yj/HxKSjE9DgACZxuTXiR/vyVGtqlUSJNIkNx0
	 10eD5Hqdc7oOTsTUoeFbFrBlI0CKXXnQXf1q1twNsaIv9JsmNZ2XxUHwqMEKxDmUUt
	 +dzHReEEz6eEw2eoXeSHAmDo454iXqueuLQm5ziw=
X-QQ-mid: zesmtpsz6t1754616061tbef0d426
X-QQ-Originating-IP: zQHRZWbedkVaYFV1bT3lY2wArHNnLUL6AKgzsJCZB+0=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 08 Aug 2025 09:20:59 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11874263861845849413
EX-QQ-RecipientCnt: 17
Date: Fri, 8 Aug 2025 09:20:59 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Conor Dooley <conor@kernel.org>
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>, Haylen Chu <heylenay@4d2.org>,
	Inochi Amaoto <inochiama@outlook.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jinmei Wei <weijinmei@linux.spacemit.com>
Subject: Re: [PATCH 1/2] dt-bindings: clock: spacemit: introduce i2s pre-clock
Message-ID: <D09A72E63AAF75B3+aJVQ-75A7NL4CJtb@LT-Guozexi>
References: <20250807-k1-clk-i2s-generation-v1-0-7dc25eb4e4d3@linux.spacemit.com>
 <20250807-k1-clk-i2s-generation-v1-1-7dc25eb4e4d3@linux.spacemit.com>
 <20250807-untrained-anthology-bcf760fe73cb@spud>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250807-untrained-anthology-bcf760fe73cb@spud>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: NcfXIs+Ms1qHW+EWzFkp+YwK1QMm0Pb5MzCCoE3/bx3D6ijFeraKHM/g
	okxeqsR9noXfcvP9XHOUcmYiQxGPYB6dE3/MX2LPYdCFzj+6owSPJ/3MXKJUt7/2b+QBbZL
	H8uiZQ2cmDkW8IuI0eEi+Fe1K8qRkb8Uh9J9jNsrcpt6V0QKRG5J74a79fC8/0JG+6qa1KM
	HpC8f1wycQtl9CyN1e6EvkNKluKeGflkUHCstixrJ/L+BgiYRJDxxD9dmswot/QRIpBVYla
	/+MxMl53qsytoeuQ6TQk7eVNJQOTM4PH9REhFmcU5MPHCYgOXojzgWrAuW/48uHzknuRD4P
	cXuQ1LXJ1vWXlQuE9PqWTaK6JF3o3QX1y2LZddcXTCjCCJplQZHCnfx+6plJh7/h8osRy4L
	cGpuGD2jO++0/4pFnIgctGEVZhHd7KR+qy5/xY4d0GhNCaW/WJX8PJYewuy+waRuZFXyQdM
	XLsHvBd739p61LtS3qsqnEYOKfL2NMk0lPAxvCvAe6V0aiTVnO4bh1x+Y0O30/89WtekhFK
	RkJGGuTmaE56UpCMCX3+s1sRhl1ZHnBrrlTXVZFSrqREwG/h9s580SMfK/LQBDjugNjLE7J
	KiTfww5a44r/Re00yIqj9JdPP0zYCdG9aD+4t4w0YPoJp98odlVJ0sUmXnPFFKmVy0qJ+vq
	iX72LdT2bvf9skczfvWmfvZ17BdKDw29/vra8LP6pkEi9bHPbZzGfMEBXsHjRiEq+Ca5m9v
	8A8f//5KcJHWrCdilMZ7jA/352NJvPw2RApoMmEY6BPpa7IRto36mCAwNrJO3+Bbqtp9xuS
	jRKIvHsV15uxUqtXJDU/8/Ooa0Zn+QZHWCjT6k7VyE54RBZXNfmGn3SN4ufcAGt8mF+Md/Y
	lz3kZGhp7xwBgZ6Oy9y9IRi6B7POWJxvi3E1TZ5kzGBmBejEuUyHPKXywurJon9SDHjuSm9
	zOeeyLAm6Sh4kQVY79NDbABUS8i1BUyTAgy54yPzyzENVaoF59DfpPM8fB7lnU5oB5sSNYs
	FzrsLjxcmvnPW6q5+n0DtiIrQrRSk=
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
X-QQ-RECHKSPAM: 0

On Thu, Aug 07, 2025 at 05:19:51PM +0100, Conor Dooley wrote:
> On Thu, Aug 07, 2025 at 09:30:10AM +0800, Troy Mitchell wrote:
> > Previously, the K1 clock driver did not include the parent clocks of
> > the I2S sysclk.
> > 
> > This patch adds their definitions to allow proper registration
> > in the driver and usage in the device tree.
> > 
> > Fixes: 1b72c59db0add ("clk: spacemit: Add clock support for SpacemiT K1 SoC")
> 
> I'm not sure that a fixes tag is suitable here, seems to be some new
> feature/development. The driver change seems to talk about how modelling
> as a fixed-clock is incorrect, but this change mentions none of that.
> Without whatever context that provides, it's hard to see how this can be
> justified as a fix rather than a new feature being added.

Introduce pre-clock to fix I2S clock; otherwise, the I2S clock may not work as expected.

I'll explain it in next version.
> 
> > Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> > ---
> >  include/dt-bindings/clock/spacemit,k1-syscon.h | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/include/dt-bindings/clock/spacemit,k1-syscon.h b/include/dt-bindings/clock/spacemit,k1-syscon.h
> > index 2714c3fe66cd5b49e12c8b20689f5b01da36b774..524268246fedd3f1238320f35244baf32354fbd2 100644
> > --- a/include/dt-bindings/clock/spacemit,k1-syscon.h
> > +++ b/include/dt-bindings/clock/spacemit,k1-syscon.h
> > @@ -77,6 +77,9 @@
> >  #define CLK_I2S_BCLK		30
> >  #define CLK_APB			31
> >  #define CLK_WDT_BUS		32
> > +#define CLK_I2S_153P6		33
> > +#define CLK_I2S_153P6_BASE	34
> > +#define CLK_I2S_SYSCLK_SRC	35
> >  
> >  /* MPMU resets */
> >  #define RESET_WDT		0
> > 
> > -- 
> > 2.50.1
> > 
> > 


