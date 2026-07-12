Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC9A7381E9E
	for <spacemit@lists.linux.dev>; Sun, 12 Jul 2026 22:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783895469; cv=none; b=BEdBawDQy/d+x4/NQ+2+SyebdSJEHqFOeGM9BIHsGRS5DNp23P/IGpLxO7JKIywxtLo6tvoeyx16Qd6h0xRXecOPggDMAdSf3Q06aK1XOFFvlkA11Oa0AZ6AzzytUBPT5f7pnx7yiiWtUf6NeXzySKSV78TqDCmzre3RxsUiToo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783895469; c=relaxed/simple;
	bh=r/9cZmwMbzZYu/sWa1YyedHNy8cyXT0ISxuu1zNc3ls=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tPmSfABaM6HM41iVScPkI8vVPVjRvmpfgVEAKjBjXzA7AiDH3HhvD7F+10KbJamiP1f36nh5m68SmY7XL7+SZSsN9HeW6h+PROw2XxD3i4+d00K40zkF0PvHkTo3ihHNirUfWh9AcbhusjPKNcwN1/DHq7s4J0Yn/t0TrjS449w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UaqWjVTv; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UaqWjVTv"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-848882fdb18so1595217b3a.0
        for <spacemit@lists.linux.dev>; Sun, 12 Jul 2026 15:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783895464; x=1784500264; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=m0aMkvFlpD7qcpmPu98mFfzTGpFjwWgjgBJW3Blyf0I=;
        b=UaqWjVTvgRiXKun7RaF4cyZ54KIDxYLhiAw9qALVNYkJMLcHE1AEUHv4YiFb7380hc
         WyD+d7sMndrVKTTDhtgViqE/UVj0GwtsgT72vmeodrOocZosBwnm1k+CFKx0CTs6+BkK
         5nuDmZ7RS/WZ5zshy38ery2rvj34Q3JbxjlRESXe8EpTT+4kqqW9nm8Q3jbR0xJncjoU
         fZ/NG9T8O988Hhfgq7cW0Sy6GFv7MZlO6N8p/oNZTUwFrd+OZdKSRW0XfMETpVzaKPab
         WLGyS1mOcHQeYnEDE2GlU8ljDNwG4jkNWJ8ghtBQnDmyinrUPFO9SSBw2m3RDQTHtQ1E
         f/lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783895464; x=1784500264;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m0aMkvFlpD7qcpmPu98mFfzTGpFjwWgjgBJW3Blyf0I=;
        b=TLJNGMKtdFgXHGsNv/i0FMvIbjsMsUSX6jZDzbhpPLxKiTxKPTQeLwAcXbpTK5H5fR
         4nrB/oU9TxUzhYRmYNWABSR6AFkGZCh2UQ2oWoIs/MriMX6cSlFP2n1reuYPO1X/sYWt
         rg1ayinIhIUWKJVIG3qf7LMIX4uFw1uIfea4Jjdf6bl0VLdbfX+pRnv2kVCre/zJulDh
         WfOLqI/HSrINGeHYoYKHAao7DT19tH/A5k9WFrIBUvjkXomUgz6ncSOdQt9yUULDX7DN
         JWitkfhhoIxBpgS1M+H+9+e6mJvg5T5lfLYvnVg72DSnAr0DmhtTIFkFhCy3+MmknMAt
         19Zw==
X-Forwarded-Encrypted: i=1; AHgh+RoDP9NGDbg1VrWzrYkXGe17Tsr0MJUxW+IROohfzBEF/BqJ7vNYQqtGDvP83OpPagvN8ixQOi2vDQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw4oDLS82GYloShOisGBsIbnZBaz2Lpx/aFcQU2z5mtu+xnDW7R
	80pLVnNyki0odNtghQ6a+H8JpMebXxX0k+cMp2CcKpaeB6Rct/uZmXIS
X-Gm-Gg: AfdE7cmz3qIJ7CoOQrhc0gU8FklbH+plqwdVqgkzoRMTehWSqAort0Mi0YYvF6/qQ3+
	CMsDWfIx447ACrdoQIbR88dfGSQmSkW1pXgjthK1/0+yE7bCN+FlUyspxPWBCsq0Tpv3l9ZqU5v
	fZxXptRJxnG41ib54AX68ehaHlj/t8U4p11OsmGBDRQdM+RfivkKgVcoiATqjTuGzZ1MOwUCLUl
	0luLgeSYkfusAeKaiD4dK4Pq5K7br5DbkuzwiUx+8ImYk+h8RGqjCgDPU1mId/nrwpE8DC5Ig3Y
	fjXAtSCeEShxmhezOE4ug4gQKDP/RNZo+CfNp222PnLHfGoX5+ggpaV7LKxZYZn7sS6ibchBzPX
	wMuXa+I2CPmyowLGDgcAsoaVCTyiHJboOs7TxpNoNgFnaXOvTKc40uRUDfii16Nhx
X-Received: by 2002:a05:6a00:3e24:b0:847:86b0:888c with SMTP id d2e1a72fcca58-8488971d94bmr6700212b3a.48.1783895463640;
        Sun, 12 Jul 2026 15:31:03 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a3b8d3310sm345744b3a.40.2026.07.12.15.31.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 15:31:03 -0700 (PDT)
Date: Mon, 13 Jul 2026 06:30:19 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Inochi Amaoto <inochiama@gmail.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Yixun Lan <dlan@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	netdev@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, E Shattow <e@freeshell.de>, Han Gao <gaohan@iscas.ac.cn>
Subject: Re: Failed to reinit phy of spacemit-dwmac when reset-gpio is present
Message-ID: <alQVRx2vCWnqCDEs@inochi.infowork>
References: <20260712045233.800748-1-inochiama@gmail.com>
 <bc78469c-3f45-4234-88b0-49f050d651db@bootlin.com>
 <8689bf7d-e00d-4097-bd3c-4d7d7844d1d2@lunn.ch>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8689bf7d-e00d-4097-bd3c-4d7d7844d1d2@lunn.ch>

On Sun, Jul 12, 2026 at 03:49:43PM +0200, Andrew Lunn wrote:
> > > --- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> > > +++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> > > @@ -196,7 +196,8 @@ &eth0 {
> > > 
> > >  	mdio {
> > >  		phy0: phy@1 {
> > > -			compatible = "ethernet-phy-ieee802.3-c22";
> > > +			compatible = "ethernet-phy-id001c.c916",
> > > +				     "ethernet-phy-ieee802.3-c22";
> > 
> > Indeed that's merely a workaround :(
> 
> Despite is being a workaround, there has not been much progress on a
> generic framework for dealing with clocks, resets, regulators etc,
> before probing PHYs. So this is probably what you want to do.
> 
>        Andrew

OK, I think I should accept the fact and let this workaround
solve the problem.

Regards,
Inochi
