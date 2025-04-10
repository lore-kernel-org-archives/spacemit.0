Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 684851C5F27
	for <spacemit@lists.linux.dev>; Thu, 10 Apr 2025 01:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744248074; cv=none; b=mXAILGlmkyKFjKZwMUyzA6OrogkJlyCBxXBaoaCO+NxxZTE1DQl7Tt5EX/Si+6s+2/nhjNxAsxnZnwv8tKNd7VlHiLHKymL8GA5r8+TxSMVQAlHSp8UbOFoM/HBUK70Xt6Wu/Yx9GUndIfkgq2TEYry8sJ+/CXbqcjtZqWFJ4/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744248074; c=relaxed/simple;
	bh=vvwNWBQOV68UD1wQ5GAz54lrRLCKIA0ppmjhWwL5XhE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eomg0+6/RSuIzoR+vZA/av7h0wWkYeSAOe0rIxKHoYBvZoyV50V6dlXcTDOxHNjJVSZ7Ogu18Bst9xB4PyXYhenLxOrh0d6dYD8tiyDAmPOihUQExUo4WrcvI8MiRxe6+WwOAO/mDlx169SGgQGkOrnI9mwPIUJ4ZK15UAL1bgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gryVo1l3; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gryVo1l3"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-476b89782c3so2727681cf.1
        for <spacemit@lists.linux.dev>; Wed, 09 Apr 2025 18:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744248071; x=1744852871; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pS6d3AN8lttz2UBagEPNT7oB3nkS/KEu1Jsz1U5vt+0=;
        b=gryVo1l3onxHCK5oLRxZIEoFpDERFxC6ioiSPLKTQRzZ3q4sA5t1ZP5EJdpXIyUw5n
         /iS14RgyTTksJg193pnhDL4CES8qmw2/sfJa2J4uEwatqmqeIy+QiG8rd2QDFOpuKfw4
         WAK3LSwpbJ+t+8KLEMlKW1URdPqXA7ewRy1bDx0IYuJPbB2ItpqTjS84H8kmsCQQrrk6
         Jk0HHU6m2MFJTYxmYyoF0Iy8Kep+tJGD5FZbffXCTe9vS1biyyq8MLQKKLyyLNfhzpJV
         C0RYUDWi6N6uRbb5wLBOo1ZxL2diSAQzzBBm2mb9uB7VUFnhoTGiSCjT9GNFNZ3P36XH
         4yFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744248071; x=1744852871;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pS6d3AN8lttz2UBagEPNT7oB3nkS/KEu1Jsz1U5vt+0=;
        b=eJPi+ifPolmMJ43Z0pAJi2+tIeZ+aPqhib3K2IAxl4AHdBtJqndkaftCwlsCLcUnse
         /r4icAYC3AzIxToUlnTYkRr50gCRqUdNuEPqBGfisKiJDaUT5riOOuY+gnbRgefVuGlN
         ev/AJEPvA3P5ah1oISF25IjcOpkoUnigBEqm+ugAMVwSW7r4n9He6lUPWaTgxqZlIXUL
         gKFNqVziYQ7qTZWdh0iY1r6CWsi74uOLWLBL6F2YXqA+f9pcXYnmuJQMTZT6fYiSNO4l
         0iJZ+sRoJeK/ULX0013rNQUlL+nmNxNW0tUJ/MtN8qc2M7UdNMSTFO71O+0VDeY0zgcs
         wIkw==
X-Forwarded-Encrypted: i=1; AJvYcCVOddwo7mSJZyrKinb9pN6ciQM/LWiXivn+DqZX9C/m76qUIpISL9SvlnVYRtgcXyPjhZfVKzJa4Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzge5qdU37NoZlNnRvdZXx1j4q3JJpEpDpHoBsqzYh+saf4wk83
	i9sow5pwaZnmS6UwTta+qll5rSzPZFtc/1wQjWm5L8hkoS+UGlmGLGMe0g==
X-Gm-Gg: ASbGncvPyJJUr+VIU15jGMEisbNTWOazA7fCXv6pYVDyEBs6Ornu9+L9Y3Fl0Lio0p5
	XLE6SUbs43ypZzZwRrDaNvtnn7R9IZgXdvsiGMf2uUTXRWf8nP/Vv40af9G+gfJ5AvjX+vNe772
	msdhm3L0hL2woess59iED9MGeV+aosfRyfD1kNUSj2z4QBsxQfmqQtSXB1YuXR7ePQKnh71tAqH
	m5DUNqowsKtFpTBcyKsoH978Xh3dL0JboCzU+THoayEroYmOeNHlWPEmtKSbc8q3dILEW3pN2yR
	vsSygDHzXJNd617gJ1DPV3oEX8I=
X-Google-Smtp-Source: AGHT+IG8syti+yUH9KMAV4gl0fZ6aSPAfqkjK2G+9Pu2agDv4XCz3CIBPgGk+tD7029TOWlX0vLivA==
X-Received: by 2002:ac8:5e4e:0:b0:476:80ce:a614 with SMTP id d75a77b69052e-4796cbb6131mr12911801cf.19.1744248071267;
        Wed, 09 Apr 2025 18:21:11 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-4796ed9ccd0sm1065881cf.57.2025.04.09.18.21.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 18:21:10 -0700 (PDT)
Date: Thu, 10 Apr 2025 09:20:33 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Alex Elder <elder@riscstar.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Yixun Lan <dlan@gentoo.org>
Cc: Haylen Chu <heylenay@4d2.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Haylen Chu <heylenay@outlook.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, spacemit@lists.linux.dev, 
	Inochi Amaoto <inochiama@outlook.com>, Chen Wang <unicornxdotw@foxmail.com>, 
	Jisheng Zhang <jszhang@kernel.org>, Meng Zhang <zhangmeng.kevin@linux.spacemit.com>
Subject: Re: [PATCH v6 3/6] clk: spacemit: Add clock support for SpacemiT K1
 SoC
Message-ID: <sl752im2sn5sz6yzc23ctprh3rwryuhgtggsaauxixn3b267ag@6sf5fahu6b5i>
References: <20250401172434.6774-1-heylenay@4d2.org>
 <20250401172434.6774-4-heylenay@4d2.org>
 <8fe0aaaa-b8e9-45dd-b792-c32be49cca1a@riscstar.com>
 <20250410003756-GYA19359@gentoo>
 <dm4lwnplwcxj3t3qx3a3bdxtziowjfoqdy4vrd3ahmzkhejrov@fa5rujatatew>
 <z27ri5eue43ti6b2te2cbxiow66mtgbnyudoo5cs4quabgbx5r@uipzoxvfoysi>
 <a8e5adca-8eff-4bbb-a7fa-ce4489b63fa5@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a8e5adca-8eff-4bbb-a7fa-ce4489b63fa5@riscstar.com>

On Wed, Apr 09, 2025 at 08:10:53PM -0500, Alex Elder wrote:
> On 4/9/25 7:57 PM, Inochi Amaoto wrote:
> > > > > > diff --git a/drivers/clk/spacemit/Kconfig b/drivers/clk/spacemit/Kconfig
> > > > > > new file mode 100644
> > > > > > index 000000000000..4c4df845b3cb
> > > > > > --- /dev/null
> > > > > > +++ b/drivers/clk/spacemit/Kconfig
> > > > > > @@ -0,0 +1,18 @@
> > > > > > +# SPDX-License-Identifier: GPL-2.0-only
> > > > > > +
> > > > > > +config SPACEMIT_CCU
> > > > > > +	tristate "Clock support for SpacemiT SoCs"
> > > > > I don't know the answer to this, but...  Should this be a Boolean
> > > > > rather than tristate?  Can a SpacemiT K1 SoC function without the
> > > > > clock driver built in to the kernel?
> > > > > 
> > > > I agree to make it a Boolean, we've already made pinctrl driver Boolean
> > > > and pinctrl depend on clk, besides, the SoC is unlikely functional
> > > > without clock built in as it's such critical..
> > > > 
> > > I disagree. The kernel is only for spacemit only, and the pinctrl
> > Sorry for a mistake, this first "only" should be "not".
> 
> This is a general problem.  You can't make a bootable
> SpacemiT kernel unless you define this as built-in (at
> least, that's what Yixun is saying). 

Why not putting the module in the initramfs? I have tested
this in quite a lot of boards (Allwinner, rockchip, sophgo,
starfive and etc.), all of them work well.

> But we'd really rather *only* build it in to the kernel
> for SpacemiT builds. You clearly want to minimize what
> must be built in, but what if this is indeed required?
> What goes in defconfig?
> 

As defconfig is more like for a minimum example system. It
is OK to put a y in the defconfig. But for a custom system,
you do give a choice for the builder to remove your module
in non spacemit system.

Regards,
Inochi
