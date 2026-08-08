Received: from mail-pj2-f3.google.com (mail-pj2-f3.google.com [74.125.227.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9125A4B0498
	for <spacemit@lists.linux.dev>; Sat,  8 Aug 2026 14:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786198470; cv=none; b=IwGwCpVUlu+wyePYv7ZhfXRbWK7cSeg0RsfRHVAAG22ilIy30/xJtT1gL7yK4XBnuRYzA/4lnqhpS49oUzBticT/NQq+2vvleXZApWwB1NLAWZNdQ5myhluoTf/QAMM7npjCe5vw62lb4FoQM27q9ZdZBIl6CHLwoEOSCZn0/1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786198470; c=relaxed/simple;
	bh=cRCYRkrqsjrsSzRNFotYZZ98meWVRPcoRMuLiucayfo=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NCgdTlbTawR97yhNGBWpgiT+X8rmOWY3axreFYRNw3RWu107LL9IuPEdVd+GNF38PfnKY5kKkKjPicpvsuymA+NBlf+LRmmurY4IC2XM6yh1364dCWInx7XJxp4FdmH6m13jxhpvVeI5uluYHSf8BZDO63Cfwwgr8GvjVAj0Ey4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I2spr71c; arc=none smtp.client-ip=74.125.227.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I2spr71c"
Received: by mail-pj2-f3.google.com with SMTP id d9443c01a7336-2ce7ac92dfcso4972225ad.1
        for <spacemit@lists.linux.dev>; Sat, 08 Aug 2026 07:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786198469; x=1786803269; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cRCYRkrqsjrsSzRNFotYZZ98meWVRPcoRMuLiucayfo=;
        b=I2spr71cvbCXQ3pNhTDXS85lIbipShg3SKtn+Mjuvvv4PgRFvw5V/r8AQ7q4xEq8J5
         g/OM8zPMYA+N1i5vTiN6OkZIJ2pYu2kTmg5lAc1DObbUdgnyced9UcPoPVxDww6Vbbuo
         fgrcR5DLNl79NUc3dZ3Bg9xjv5/8FG3DIkYOdGRrAcxRWakMNZYJfFiWHmUHMiL/8+6v
         EBM62JkFElBZjhgUBHRUnVjjXB9GzcUh6ZGkdrll7t50gwtjeuwCJRc7iF+XdB2iBvoX
         iCyHQb82SOY847fuamPrzaTnqTVeYqWN0KOWi2LKlv6i2cU4I4lF04R8FyM/TBxmufR4
         z16g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786198469; x=1786803269;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cRCYRkrqsjrsSzRNFotYZZ98meWVRPcoRMuLiucayfo=;
        b=aj9rft3SYofHz4bOuL4X19cKQU6zFphobqBANnJiN5eH4OqwN+um7EF4/kszukB9Hq
         /UPS8Xv97GCOW4VheGBsOJQy5N1SkKwgOIKzdugTL/5bFspSKnVv/bbfYsRrbc1+8Z1J
         dOm7ce+64O93amRnexYqgluC03JGe4MgvcU8MoxpMuAig10ns5mc5B77Rzlc83icIOYG
         4wksAl83OlrSblVigiCNPsZvZoZ/s6G5XTePAc2PMmIlb6SmrfFEQA+4FUTvIn7wiaIr
         gM9HOFXCCk99tgOg/hlBzU6I7bxhTtdmCc+LqLjgQ63hMcqUnBdvy+QoHIqFxd/3i3ys
         Gj6Q==
X-Forwarded-Encrypted: i=1; AHgh+RqVM+1mFNgYwWtqKMCB1mWXP1QhrsbOMJt+XHk24kswyNJnyNH6SDG/JO0uUhobK3aVRyKKvbpYsw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwPHYrJDXD8R7iuBE5NbX+4CmOc3XN+6td9zAfyJUlRLjFhdjlv
	bvP1Ie2+2KbKnwJeQImGuwtl93/zd8m8/+dVDYaQWSe2TCm2LtKwRiwQ
X-Gm-Gg: AR+sD11AWH5am7cX/OwsFcEV3++NTOzCdl+9ZaFCtviAMM2eWkGxMLpZZXCfwldyaG4
	LkC2/j3dgJvylUIq6kGArgOxESwfipfKYlBis1vA00tkybV32oukwdJVx2ecFxHqJZ9FR3HaFNH
	RTG0R6lWdITfaRvtv4bo8yNH9S3DNEsKfWjzCwEomiq4bZiXKHbGRf3KKOHfZv1Xmgg4S18XYgq
	8t0bS9BlrMKAPhesPuJNqYZC7T9WgYaxS7tso/yX6HCwdOmcf8blPzwfc0BGGI4NyseDzWt6Cty
	C5c4rOHUZsrDbJKSmO/HxnO5Kupjg6Z6lpQdQ4nI07cq50ZwaEUbX5ymGvvH71Q7ShWNOslchE+
	5OW5D/HmQzR5AIaCO9pX7KYhqhsdupx0s1MLdw6e/dtXdTvwrBRZpCp+aURnup6GRdqMDbG26w4
	g/Rr9RcFyXdjRd6SJGVCJLWCZIEqUwnppYPyMQDdQ=
X-Received: by 2002:a17:903:f90:b0:2c9:b2c1:13ec with SMTP id d9443c01a7336-2d294c225a1mr141926765ad.11.1786198469018;
        Sat, 08 Aug 2026 07:14:29 -0700 (PDT)
Received: from localhost ([2403:2c80:17:1e::20db])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d14dbeaa7bsm19180265ad.41.2026.08.08.07.14.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 07:14:28 -0700 (PDT)
Date: Sat, 08 Aug 2026 22:14:25 +0800
Message-ID: <16421007bf6b2a251ccf51cbb5bf3694.codykang.hk@gmail.com>
From: Cody Kang <codykang.hk@gmail.com>
To: Uwe =?utf-8?q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Haylen Chu <heylenay@4d2.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, dri-devel@lists.freedesktop.org,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-clk@vger.kernel.org
Subject: 
 Re: [PATCH RESEND 05/17] phy: spacemit: add Innosilicon DP TX PHY driver
In-Reply-To: <amnzTxDYtSBojHdY@monoceros>
References: <20260725-k3-display-v1-0-6de34d80e86c@gmail.com>
 <20260725-k3-display-v1-5-6de34d80e86c@gmail.com>
 <amnzTxDYtSBojHdY@monoceros>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Hi Uwe,

On Wed, 29 Jul 2026 14:36:31 +0200, Uwe Kleine-König wrote:
> Hello,
>
> On Sat, Jul 25, 2026 at 12:51:14AM -0400, Cody Kang via B4 Relay wrote:
> > +#include <linux/mod_devicetable.h>
> > [...]
> > +#include <linux/platform_device.h>
>
> <linux/platform_device.h> already makes sure that of_device_id
> is available and <linux/mod_devicetable.h> will go away soon.
>
> So please drop the latter #include.

Thanks for the review. Will do in v2.

Cody
